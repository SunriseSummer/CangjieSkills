# 仓颉语言 macro_dsl 开发任务书

## 1. 任务目标

使用仓颉（Cangjie）编程语言的**宏（Macro）**特性，实现一个类似 C# LINQ 的集合查询 DSL（Domain Specific Language），支持：

- **过滤**（where）：根据条件筛选集合元素
- **映射**（select）：将元素转换为新的值
- **排序**（orderby）：对结果进行升序或降序排列
- **计数**（count）：统计满足条件的元素个数

该 DSL 通过仓颉**属性宏**（Attribute Macro）实现，在编译时展开为等价的仓颉代码。

---

## 2. 项目结构

```
macro_dsl/
├── cjpm.toml                      # 主项目配置
├── src/
│   ├── main.cj                    # 入口文件（演示用）
│   └── macro_dsl_test.cj          # 单元测试（已经给定）
└── macros/                        # 宏包模块
    ├── cjpm.toml                  # 宏包配置
    └── src/
        └── query_macro.cj         # @query 宏实现
```

### 2.1 主项目 cjpm.toml

```toml
[package]
  cjc-version = "1.0.5"
  name = "macro_dsl"
  version = "1.0.0"
  output-type = "executable"

[dependencies]
  macros = { path = "./macros" }
```

### 2.2 宏包 macros/cjpm.toml

```toml
[package]
  cjc-version = "1.0.5"
  name = "macros"
  version = "1.0.0"
  output-type = "static"
  compile-option = "--compile-macro"
```

---

## 3. DSL 语法规格

### 3.1 概述

`@query` 是一个**属性宏**（两个参数），调用格式为 `@query[属性](查询表达式)`。

根据属性内容，宏支持两种模式：

| 模式 | 属性内容 | 返回类型 | 说明 |
|------|----------|----------|------|
| **Select 模式** | 类型名（如 `Int64`、`String`、`Bool`） | `Array<T>` | 过滤、转换、排序集合元素 |
| **Count 模式** | `count` | `Int64` | 统计满足条件的元素个数 |

### 3.2 Select 模式语法

```
@query[结果元素类型](from 变量名 in 集合表达式 [where 条件表达式]* select 映射表达式 [orderby [asc|desc]])
```

**子句说明**：

| 子句 | 是否必需 | 可重复 | 说明 |
|------|----------|--------|------|
| `from 变量名 in 集合表达式` | ✅ 必需 | ❌ | 指定迭代变量和数据源，须为第一个子句 |
| `where 条件表达式` | ❌ 可选 | ✅ 可多次 | 过滤条件，多个 where 之间为逻辑与（AND）关系 |
| `select 映射表达式` | ✅ 必需 | ❌ | 指定结果元素的映射/转换表达式 |
| `orderby [asc\|desc]` | ❌ 可选 | ❌ | 对最终结果排序，默认升序（asc）；须位于最后 |

**示例**：

```cangjie
// 基本查询：筛选大于 3 的元素，乘以 2
let result = @query[Int64](from x in arr where x > 3 select x * 2)
// result 类型为 Array<Int64>

// 多个 where 条件
let result = @query[Int64](from x in arr where x > 2 where x < 8 select x)

// 带排序（降序）
let result = @query[Int64](from x in arr select x orderby desc)

// 类型转换
let result = @query[String](from x in arr select x.toString())

// 布尔映射
let result = @query[Bool](from x in arr select x > 3)
```

### 3.3 Count 模式语法

```
@query[count](from 变量名 in 集合表达式 [where 条件表达式]*)
```

Count 模式不包含 `select` 和 `orderby` 子句，返回类型始终为 `Int64`。

**示例**：

```cangjie
// 计算所有元素的个数
let total: Int64 = @query[count](from x in arr)

// 计算满足条件的元素个数
let cnt: Int64 = @query[count](from x in arr where x > 5)
```

### 3.4 子句顺序

子句严格按以下顺序排列：

```
from ... in ...  →  [where ...]* →  select ...  →  [orderby ...]
                                    或不含（Count 模式）
```

---

## 4. 宏实现规格

### 4.1 宏签名

```cangjie
macro package macros

import std.ast.*

public macro query(attrTokens: Tokens, inputTokens: Tokens): Tokens
```

- `attrTokens`：属性内容（`[]` 内的 token），用于确定模式和结果类型
- `inputTokens`：查询表达式（`()` 内的 token），包含所有 DSL 子句

### 4.2 Token 解析要求

宏需要实现一个简易的 **Token 扫描器**，从输入 token 序列中识别 DSL 关键字并提取各子句的 token 范围：

- **DSL 关键字**：`from`、`in`、`where`、`select`、`orderby`、`count`、`asc`、`desc`
- **关键字识别**：仅在顶层（不在括号/方括号/花括号嵌套内）匹配，通过 `token.value` 检查字符串值
- **括号深度追踪**：遇到 `(`、`[`、`{` 时深度加 1，遇到 `)`、`]`、`}` 时深度减 1，深度为 0 时才识别关键字

> **注意**：DSL 关键字（`from`、`where`、`select` 等）在查询表达式内为保留字，不可作为变量名或函数名使用。但在括号嵌套内的同名标识符不受影响。

### 4.3 模式判断

通过检查 `attrTokens` 的第一个 token 值来判断模式：

- 若值为 `"count"` → Count 模式
- 否则 → Select 模式，`attrTokens` 作为结果集合的元素类型

### 4.4 代码生成模式

宏展开后生成**立即调用的 Lambda 表达式**（Immediately Invoked Lambda），格式为 `{ => ... }()`。

#### Select 模式（无 orderby）生成代码：

```cangjie
// @query[Int64](from x in arr where x > 3 select x * 2)
// 展开为：
{ =>
    var _query_result = ArrayList<Int64>()
    for (x in arr) {
        if (x > 3) {
            _query_result.add(x * 2)
        }
    }
    _query_result.toArray()
}()
```

#### Select 模式（无 where）生成代码：

```cangjie
// @query[Int64](from x in arr select x * 2)
// 展开为：
{ =>
    var _query_result = ArrayList<Int64>()
    for (x in arr) {
        _query_result.add(x * 2)
    }
    _query_result.toArray()
}()
```

#### Select 模式（多个 where）生成代码：

```cangjie
// @query[Int64](from x in arr where x > 2 where x < 8 select x)
// 展开为：
{ =>
    var _query_result = ArrayList<Int64>()
    for (x in arr) {
        if (x > 2 && x < 8) {
            _query_result.add(x)
        }
    }
    _query_result.toArray()
}()
```

多个 `where` 条件用 `&&` 连接。

#### Select 模式（带 orderby asc）生成代码：

```cangjie
// @query[Int64](from x in arr select x orderby asc)
// 展开为：
{ =>
    var _query_result = ArrayList<Int64>()
    for (x in arr) {
        _query_result.add(x)
    }
    sort(_query_result)
    _query_result.toArray()
}()
```

#### Select 模式（带 orderby desc）生成代码：

```cangjie
// @query[Int64](from x in arr select x orderby desc)
// 展开为：
{ =>
    var _query_result = ArrayList<Int64>()
    for (x in arr) {
        _query_result.add(x)
    }
    sort(_query_result)
    _query_result.reverse()
    _query_result.toArray()
}()
```

`orderby` 对结果列表排序：先调用 `sort()` 升序排列，降序时再调用 `reverse()`。

> **注意**：`orderby` 是对 `select` 之后的结果排序。即先收集所有映射后的值，再对它们排序。

#### Count 模式（无 where）生成代码：

```cangjie
// @query[count](from x in arr)
// 展开为：
{ =>
    var _query_count: Int64 = 0
    for (x in arr) {
        _query_count += 1
    }
    _query_count
}()
```

#### Count 模式（带 where）生成代码：

```cangjie
// @query[count](from x in arr where x > 3)
// 展开为：
{ =>
    var _query_count: Int64 = 0
    for (x in arr) {
        if (x > 3) {
            _query_count += 1
        }
    }
    _query_count
}()
```

### 4.5 orderby 默认排序方向

- `orderby` — 默认升序（等价于 `orderby asc`）
- `orderby asc` — 升序
- `orderby desc` — 降序

### 4.6 数据源兼容性

生成的 `for-in` 循环适用于任何实现了 `Iterable` 接口的类型，包括但不限于：

- `Array<T>`
- `ArrayList<T>`

---

## 5. 依赖与导入要求

### 5.1 宏包内部

```cangjie
macro package macros

import std.ast.*
import std.collection.*    // 宏实现代码中使用 ArrayList 等
```

### 5.2 用户代码（调用宏的模块）

```cangjie
import std.collection.*    // 宏展开后的代码使用 ArrayList
import std.sort.*          // 宏展开后的代码使用 sort()（当使用 orderby 时）
import macros.*            // 导入 @query 宏
```

---

## 6. 单元测试要求

测试文件已给定为 `macro_dsl_test.cj`，**不要做修改**，直接引入项目并使用仓颉单元测试框架测试。

测试文件包含 **6 个测试类、28 个测试用例**：

| 测试类 | 测试内容 | 用例数 |
|--------|----------|--------|
| `TestBasicSelect` | 基本查询（全选、恒等、表达式变换、取反） | 4 |
| `TestWhereClause` | 过滤（单条件、多条件、无匹配、全匹配、取模、复杂条件） | 6 |
| `TestOrderBy` | 排序（升序、降序、带过滤、默认方向、带变换） | 5 |
| `TestCount` | 计数（全部、带过滤、零匹配、多条件） | 4 |
| `TestTypeConversion` | 类型转换（Int64→String、Int64→Bool） | 2 |
| `TestComplexQuery` | 复杂场景（ArrayList源、空集合、单元素、过滤+变换、全功能流水线、大数据集、计数与查询一致性） | 7 |

---

## 7. 入口文件（main.cj）

```cangjie
package macro_dsl

import std.collection.*
import std.sort.*
import macros.*

main(): Int64 {
    let data = [5, 3, 8, 1, 9, 2, 7, 4, 6, 10]

    // Filter and transform
    let result = @query[Int64](from x in data where x > 5 select x * 2)
    print("Filtered and doubled:")
    for (v in result) {
        print(" ${v}")
    }
    println("")

    // Count
    let cnt = @query[count](from x in data where x > 5)
    println("Count > 5: ${cnt}")

    // Sort descending
    let sorted = @query[Int64](from x in data select x orderby desc)
    print("Sorted desc:")
    for (v in sorted) {
        print(" ${v}")
    }
    println("")

    return 0
}
```

期望输出：

```
Filtered and doubled: 16 18 14 12 20
Count > 5: 5
Sorted desc: 10 9 8 7 6 5 4 3 2 1
```

---

## 8. 验收标准

1. `cjpm build` 编译成功，无错误
2. `cjpm run` 正确输出预期结果
3. `cjpm test` 全部测试通过（28 个测试用例，0 失败）
4. 代码结构清晰，宏包与主包分离
5. 宏实现使用 `quote` 与 `$()` 插值生成代码，Token 解析逻辑清晰
