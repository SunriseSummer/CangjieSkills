# 简化版 Mustache 模板引擎开发任务书

## 1. 任务概述

使用仓颉语言从零实现一个简化版 Mustache 模板引擎，**不使用**标准库或第三方库中的模板引擎模块。要求：

1. 将模板字符串解析为内部表示（AST）
2. 根据数据上下文渲染模板，输出结果字符串
3. 通过 API 构建数据上下文

最终让`mustache_test.cj`中给定的测试用例都通过，不能修改测试代码（直接拷贝到 `src` 目录下使用）

## 2. 项目结构

```
mustache/
├── cjpm.toml
└── src/
    ├── main.cj                 # 入口演示
    ├── mustache_value.cj       # 数据模型（值类型层级）
    ├── mustache_template.cj    # 模板解析器与渲染器
    └── mustache_test.cj        # 单元测试（52 个测试用例，直接拷贝，不可修改）
```

`cjpm.toml` 配置：

```toml
[package]
  cjc-version = "1.0.5"
  name = "mustache"
  description = "nothing here"
  version = "1.0.0"
  target-dir = ""
  output-type = "executable"
  compile-option = ""
  override-compile-option = ""
  link-option = ""
  package-configuration = {}

[dependencies]
```

## 3. API 规格

### 3.1 MustacheException

```
public class MustacheException <: Exception
```

- 构造函数：`init(message: String)`
- 用于模板解析和渲染过程中的错误

### 3.2 MustacheValue（抽象基类）

```
public abstract class MustacheValue
```

类型检查方法（默认返回 `false`）：

| 方法 | 返回类型 | 说明 |
|------|---------|------|
| `isNone()` | `Bool` | 是否为空值 |
| `isBool()` | `Bool` | 是否为布尔值 |
| `isString()` | `Bool` | 是否为字符串 |
| `isList()` | `Bool` | 是否为列表 |
| `isContext()` | `Bool` | 是否为上下文 |

类型转换方法（默认抛出 `MustacheException`）：

| 方法 | 返回类型 | 说明 |
|------|---------|------|
| `asBool()` | `Bool` | 获取布尔值 |
| `asString()` | `String` | 获取字符串值 |

### 3.3 MustacheNone

```
public class MustacheNone <: MustacheValue
```

- 构造函数：`init()`
- `isNone()` 返回 `true`
- 表示缺失或未定义的值

### 3.4 MustacheBool

```
public class MustacheBool <: MustacheValue
```

- 构造函数：`init(value: Bool)`
- `isBool()` 返回 `true`
- `asBool()` 返回存储的布尔值

### 3.5 MustacheStr

```
public class MustacheStr <: MustacheValue
```

- 构造函数：`init(value: String)`
- `isString()` 返回 `true`
- `asString()` 返回存储的字符串值

### 3.6 MustacheList

```
public class MustacheList <: MustacheValue
```

- 构造函数：`init()`（创建空列表）
- `isList()` 返回 `true`

| 方法 | 返回类型 | 说明 |
|------|---------|------|
| `size()` | `Int64` | 列表元素个数 |
| `add(value: MustacheValue)` | `Unit` | 添加元素 |
| `get(index: Int64)` | `MustacheValue` | 按索引获取元素 |

### 3.7 MustacheContext

```
public class MustacheContext <: MustacheValue
```

- 构造函数：`init()`（创建空上下文）
- `isContext()` 返回 `true`

| 方法 | 返回类型 | 说明 |
|------|---------|------|
| `get(key: String)` | `?MustacheValue` | 按键获取值，不存在返回 `None` |
| `put(key: String, value: MustacheValue)` | `Unit` | 设置键值对，键已存在则覆盖 |
| `containsKey(key: String)` | `Bool` | 检查键是否存在 |

### 3.8 MustacheTemplate

```
public class MustacheTemplate
```

| 方法 | 返回类型 | 说明 |
|------|---------|------|
| `static fromString(template: String)` | `MustacheTemplate` | 解析模板字符串 |
| `render(context: MustacheContext)` | `String` | 用数据上下文渲染模板 |

## 4. 模板语法

### 4.1 变量插值（HTML 转义）

```
{{name}}
```

- 查找上下文中键为 `name` 的值，转换为字符串后进行 **HTML 转义** 输出
- 标签内名称前后的空白会被忽略：`{{ name }}` 等价于 `{{name}}`
- 值缺失时输出空字符串

### 4.2 非转义变量

```
{{{name}}}
{{&name}}
```

- 两种语法等价，输出原始字符串，**不进行** HTML 转义
- 值缺失时输出空字符串

### 4.3 区段（Section）

```
{{#name}}...{{/name}}
```

区段的行为取决于 `name` 对应值的类型：

| 值类型 | 行为 |
|--------|------|
| 假值（见下方定义） | 不渲染区段内容 |
| `MustacheBool(true)` | 渲染一次，使用当前上下文 |
| `MustacheStr` | 渲染一次，使用当前上下文 |
| `MustacheContext` | 渲染一次，将该上下文压入上下文栈 |
| `MustacheList`（非空） | 对列表中每个元素渲染一次 |

**假值定义**：以下值被视为"假"（falsy），区段不渲染：
- `MustacheNone`（包括上下文中不存在的键）
- `MustacheBool(false)`
- 空的 `MustacheList`（`size() == 0`）

**列表迭代**：遍历 `MustacheList` 时，对每个元素：
- 若元素为 `MustacheContext`，将其压入上下文栈，渲染区段内容，然后弹出
- 若元素为其他类型（如 `MustacheStr`），可通过 `{{.}}` 访问当前元素值

### 4.4 反向区段（Inverted Section）

```
{{^name}}...{{/name}}
```

- 与区段相反：仅当值为假值时渲染内容
- 假值定义与区段相同

### 4.5 注释

```
{{! 这是注释 }}
```

- 注释内容在渲染时被完全忽略，不输出任何内容

### 4.6 点号取值（`{{.}}`）

```
{{.}}
```

- 在列表迭代中，`{{.}}` 引用当前迭代元素的值
- 在列表外使用时输出空字符串

### 4.7 点号导航（Dot Notation）

```
{{person.name}}
{{a.b.c}}
```

- 通过 `.` 分隔的路径访问嵌套上下文中的值
- 逐级查找：先在上下文中找 `person`，得到 `MustacheContext` 后再找 `name`
- 路径中任何一级不存在或不是 `MustacheContext`，输出空字符串

## 5. HTML 转义规则

`{{name}}` 形式的变量插值会对以下字符进行转义：

| 原字符 | 转义结果 |
|--------|---------|
| `&` | `&amp;` |
| `<` | `&lt;` |
| `>` | `&gt;` |
| `"` | `&quot;` |
| `'` | `&#39;` |

**注意**：`&` 必须最先替换，避免二次转义。

## 6. 上下文栈

模板渲染使用**上下文栈**机制：

1. 初始渲染时，根上下文为栈底
2. 进入 `MustacheContext` 类型的区段时，将该上下文压入栈顶
3. 变量查找时，从栈顶向栈底依次搜索，**第一个**包含目标键的上下文提供值
4. 离开区段时，弹出栈顶上下文

这使得内层区段可以访问外层上下文的变量（父级回退），同时内层同名变量会覆盖外层。

**示例**：

```
模板：{{#person}}{{name}} - {{title}}{{/person}}
上下文：{ title: "Engineer", person: { name: "Alice" } }
输出：Alice - Engineer
```

`name` 在 `person` 上下文中找到，`title` 在 `person` 中未找到，回退到根上下文找到。

## 7. 值到字符串的转换

变量插值时，值按以下规则转换为字符串：

| 值类型 | 字符串表示 |
|--------|-----------|
| `MustacheStr` | 返回存储的字符串 |
| `MustacheBool` | `"true"` 或 `"false"` |
| 其他（`MustacheNone`、`MustacheList`、`MustacheContext`） | 空字符串 `""` |

## 8. 错误处理

以下情况应抛出 `MustacheException`：

| 错误 | 示例 | 说明 |
|------|------|------|
| 未闭合的标签 | `{{name` | 缺少 `}}` |
| 未闭合的区段 | `{{#a}}text` | 缺少 `{{/a}}` |
| 区段标签不匹配 | `{{#a}}text{{/b}}` | 开始和结束标签名不一致 |
| 意外的关闭标签 | `{{/a}}` | 没有对应的开始标签 |

## 9. 测试

项目提供 52 个测试用例（`mustache_test.cj`），覆盖以下场景：

| 测试类 | 测试数 | 覆盖内容 |
|--------|--------|---------|
| TestVariableInterpolation | 8 | 简单变量、多变量、缺失变量、HTML 转义、空模板、纯文本、标签内空白 |
| TestUnescapedVariable | 4 | 三重花括号、`&` 语法、缺失值、混合转义 |
| TestSections | 8 | 布尔真/假、缺失键、列表迭代、空列表、上下文区段、上下文列表、嵌套区段 |
| TestInvertedSections | 5 | 假值显示、真值隐藏、缺失键、空列表、非空列表 |
| TestComments | 3 | 注释移除、纯注释、模板中的注释 |
| TestDotNotation | 4 | 嵌套访问、深层嵌套、缺失嵌套、非上下文导航 |
| TestDotValue | 3 | 列表中使用 `{{.}}`、列表外使用、带分隔符 |
| TestContextStack | 3 | 父级回退、内层覆盖、深层上下文栈 |
| TestErrorHandling | 4 | 未闭合标签、标签不匹配、未闭合区段、意外关闭标签 |
| TestBuildValues | 7 | 构建上下文、覆盖写入、构建列表、类型检查、类型不匹配异常、缺失键、布尔值 |
| TestComplex | 3 | HTML 模板综合、嵌套列表、条件区段（同一模板不同上下文） |

**要求**：将 `mustache_test.cj` 直接拷贝到项目的 `src/` 目录中，**不修改**测试代码。

## 10. 入口演示（main.cj）

```cangjie
package mustache

main(): Int64 {
    let template = MustacheTemplate.fromString("Hello, {{name}}! {{#items}}<li>{{.}}</li> {{/items}}{{^items}}No items.{{/items}}")
    let ctx = MustacheContext()
    ctx.put("name", MustacheStr("World"))
    let items = MustacheList()
    items.add(MustacheStr("Apple"))
    items.add(MustacheStr("Banana"))
    items.add(MustacheStr("Cherry"))
    ctx.put("items", items)
    println("Rendered:")
    println(template.render(ctx))
    return 0
}
```

预期输出：

```
Rendered:
Hello, World! <li>Apple</li> <li>Banana</li> <li>Cherry</li> 
```

## 11. 验收标准

1. `cjpm build` 编译成功，无错误、无警告
2. `cjpm run` 输出与预期一致
3. `cjpm test` 全部 52 个测试通过
4. 不使用标准库或第三方模板引擎模块
5. 代码结构清晰，模板解析与渲染逻辑分离
