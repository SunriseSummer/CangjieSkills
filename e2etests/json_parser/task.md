# 仓颉语言 JsonParser 开发任务书

## 1. 任务目标

使用仓颉（Cangjie）编程语言，**从零实现**一个简单的 JSON 解析器（不可使用标准库或三方库提供的 JSON 模块），支持：

- **解析**（parse）：将 JSON 字符串解析为内存中的树形数据结构
- **序列化**（serialize）：将树形数据结构转换回紧凑格式的 JSON 字符串
- **构建**（build）：通过 API 手动构建 JSON 数据结构

---

## 2. 项目结构

```
json_parser/
├── cjpm.toml                  # 项目配置
├── src/
│   ├── main.cj                # 入口文件（演示用）
│   ├── json_value.cj          # JSON 值类型定义 + 异常 + 序列化
│   ├── json_parser.cj         # 递归下降解析器
│   └── json_parser_test.cj    # 单元测试（已经给定）
```

### 2.1 项目初始化

```bash
cjpm init --name json_parser --type=executable
```

### 2.2 cjpm.toml 配置

```toml
[package]
  cjc-version = "1.0.5"
  name = "json_parser"
  version = "1.0.0"
  output-type = "executable"
```

---

## 3. API 设计规格

### 3.1 异常类型

```
JsonException <: Exception
  - init(message: String)
```

所有解析错误和类型不匹配操作均抛出 `JsonException`。

### 3.2 值类型层次

```
abstract class JsonValue <: ToString
├── JsonNull       — JSON null
├── JsonBool       — JSON true/false
├── JsonNum        — JSON number（Float64 存储）
├── JsonStr        — JSON string
├── JsonArr        — JSON array
└── JsonObj        — JSON object
```

### 3.3 JsonValue（抽象基类）

| 方法 | 签名 | 说明 |
|------|------|------|
| `isNull` | `public open func isNull(): Bool` | 默认返回 `false` |
| `isBool` | `public open func isBool(): Bool` | 默认返回 `false` |
| `isNumber` | `public open func isNumber(): Bool` | 默认返回 `false` |
| `isString` | `public open func isString(): Bool` | 默认返回 `false` |
| `isArray` | `public open func isArray(): Bool` | 默认返回 `false` |
| `isObject` | `public open func isObject(): Bool` | 默认返回 `false` |
| `asBool` | `public open func asBool(): Bool` | 默认抛出 `JsonException` |
| `asNumber` | `public open func asNumber(): Float64` | 默认抛出 `JsonException` |
| `asString` | `public open func asString(): String` | 默认抛出 `JsonException` |
| `fromString` | `public static func fromString(input: String): JsonValue` | 解析 JSON 字符串 |
| `toString` | `func toString(): String` | 序列化为 JSON 字符串（继承自 `ToString` 接口） |

### 3.4 JsonNull

| 方法 | 行为 |
|------|------|
| `init()` | 无参构造 |
| `isNull()` | 返回 `true` |
| `toString()` | 返回 `"null"` |

### 3.5 JsonBool

| 方法 | 行为 |
|------|------|
| `init(value: Bool)` | 构造布尔值 |
| `isBool()` | 返回 `true` |
| `asBool()` | 返回存储的布尔值 |
| `toString()` | 返回 `"true"` 或 `"false"` |

### 3.6 JsonNum

| 方法 | 行为 |
|------|------|
| `init(value: Float64)` | 构造数值 |
| `isNumber()` | 返回 `true` |
| `asNumber()` | 返回存储的 Float64 值 |
| `toString()` | 整数值输出为 `"42"`（无小数点），浮点值输出为 `"3.14"` 等 |

**数字格式要求**：整数值（如 `42.0`）序列化时**不带小数点**，输出 `"42"`。

### 3.7 JsonStr

| 方法 | 行为 |
|------|------|
| `init(value: String)` | 构造字符串 |
| `isString()` | 返回 `true` |
| `asString()` | 返回存储的字符串（不含引号） |
| `toString()` | 返回带引号和转义的 JSON 字符串，如 `"\"hello\""` |

**序列化转义要求**：`toString()` 须对以下字符进行转义：

| 字符 | 转义输出 |
|------|----------|
| `"` | `\"` |
| `\` | `\\` |
| 换行符 | `\n` |
| 回车符 | `\r` |
| 制表符 | `\t` |

### 3.8 JsonArr

| 方法 | 签名 | 行为 |
|------|------|------|
| `init()` | `public init()` | 构造空数组 |
| `isArray()` | `public override func isArray(): Bool` | 返回 `true` |
| `size()` | `public func size(): Int64` | 返回元素个数 |
| `add(value)` | `public func add(value: JsonValue): Unit` | 追加元素 |
| `get(index)` | `public func get(index: Int64): JsonValue` | 按索引获取元素 |
| `toString()` | `public func toString(): String` | 紧凑格式序列化，如 `[1,2,3]` |

### 3.9 JsonObj

| 方法 | 签名 | 行为 |
|------|------|------|
| `init()` | `public init()` | 构造空对象 |
| `isObject()` | `public override func isObject(): Bool` | 返回 `true` |
| `size()` | `public func size(): Int64` | 返回键值对个数 |
| `get(key)` | `public func get(key: String): ?JsonValue` | 按键获取值，不存在返回 `None` |
| `put(key, value)` | `public func put(key: String, value: JsonValue): Unit` | 添加/覆盖键值对 |
| `containsKey(key)` | `public func containsKey(key: String): Bool` | 检查键是否存在 |
| `keys()` | `public func keys(): ArrayList<String>` | 返回所有键的列表 |
| `toString()` | `public func toString(): String` | 紧凑格式序列化，如 `{"a":1}` |

**对象特性**：
- 保持键的插入顺序
- `put` 对已存在的键执行覆盖操作

---

## 4. 解析器规格

### 4.1 解析入口

```cangjie
let value = JsonValue.fromString(jsonString)
```

### 4.2 解析器类

```cangjie
public class JsonParser {
    public init(text: String)
    public func parse(): JsonValue
}
```

- `parse()` 解析完成后，应检查输入是否已完全消费（忽略尾部空白）
- 输入未完全消费时抛出 `JsonException`

### 4.3 支持的 JSON 语法

| 元素 | 语法示例 | 说明 |
|------|----------|------|
| null | `null` | |
| 布尔 | `true`, `false` | |
| 整数 | `0`, `42`, `-7` | |
| 浮点数 | `3.14`, `-0.5` | |
| 科学计数法 | `1e3`, `1.5e-2`, `2E+5` | |
| 字符串 | `"hello"`, `""` | |
| 字符串转义 | `\"`, `\\`, `\/`, `\n`, `\r`, `\t`, `\b`, `\f` | 标准 JSON 转义 |
| Unicode 转义 | `\u4f60\u597d` → `你好` | 4 位十六进制 |
| 数组 | `[]`, `[1, "a", true]` | |
| 对象 | `{}`, `{"key": "value"}` | |
| 嵌套 | `{"a": [1, {"b": 2}]}` | 任意深度嵌套 |
| 空白 | 空格、制表符、换行、回车 | 结构性空白被忽略 |

### 4.4 不支持的语法（应拒绝）

- 尾部逗号：`[1,]`, `{"a":1,}`
- 单引号字符串：`'hello'`
- 注释：`// comment`, `/* comment */`
- 未加引号的键：`{key: "value"}`
- 解析后输入中有多余非空白字符

### 4.5 解析器实现方式

使用**递归下降**（Recursive Descent）方法实现，建议以 `Array<Rune>`（Unicode 字符数组）作为内部表示来遍历输入字符串，核心方法包括：

- `skipWhitespace()` — 跳过空白字符
- `parseValue()` — 根据当前字符分发到具体的解析方法
- `parseString()` — 解析 JSON 字符串（含转义处理）
- `parseNumber()` — 解析 JSON 数字
- `parseArray()` — 解析 JSON 数组
- `parseObject()` — 解析 JSON 对象
- `parseTrue()` / `parseFalse()` / `parseNull()` — 解析关键字

---

## 5. 序列化规格

所有 `JsonValue` 子类的 `toString()` 方法须生成**紧凑格式**（无空格、无换行）的合法 JSON 字符串。

### 5.1 序列化要求

| 类型 | 输入/构建 | `toString()` 输出 |
|------|-----------|-------------------|
| null | `JsonNull()` | `null` |
| 布尔 | `JsonBool(true)` | `true` |
| 整数 | `JsonNum(42.0)` | `42` |
| 浮点 | `JsonNum(3.14)` | `3.14...`（浮点表示） |
| 字符串 | `JsonStr("hello")` | `"hello"` |
| 含转义字符串 | `JsonStr("a\nb")` | `"a\nb"` |
| 空数组 | `JsonArr()` | `[]` |
| 数组 | `[JsonNum(1.0), JsonNum(2.0)]` | `[1,2]` |
| 空对象 | `JsonObj()` | `{}` |
| 对象 | `{"a": 1, "b": "hello"}` | `{"a":1,"b":"hello"}` |

### 5.2 往返一致性（Round-trip）

对于紧凑格式的合法 JSON 字符串，解析后再序列化应得到**完全相同**的字符串：

```cangjie
let input = ##"{"name":"Alice","age":30,"active":true}"##
let output = JsonValue.fromString(input).toString()
// output == input
```

---

## 6. 单元测试要求

测试文件已经给定为 `json_parser_test.cj`，**不要做修改**，直接引入项目并使用仓颉单元测试框架测试。

---

## 7. 入口文件（main.cj）

```cangjie
package json_parser

main(): Int64 {
    let jsonStr = ##"{"name":"Alice","age":30,"active":true,"scores":[90,85,95],"address":null}"##
    let value = JsonValue.fromString(jsonStr)
    println("Parsed JSON:")
    println(value.toString())
    return 0
}
```

期望输出：

```
Parsed JSON:
{"name":"Alice","age":30,"active":true,"scores":[90,85,95],"address":null}
```

---

## 8. 验收标准

1. `cjpm build` 编译成功，无错误，无警告
2. `cjpm run` 正确输出解析后的 JSON 字符串
3. `cjpm test` 全部测试通过（约 68 个测试用例，0 失败）
4. 代码结构清晰，文件划分合理
