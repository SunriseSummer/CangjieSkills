<!-- cj-doc kind="api-type" level="5" id="std.ast.struct.position" parent="std.ast" -->
# Position

[← std.ast](../../index.md)

`Position <: ToBytes`

表示位置信息的数据结构，包含文件 ID、行号和列号。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`column: Int32`](field-column.md) | 获取列号信息。 |
| [`fileID: UInt32`](field-fileid.md) | 获取文件 ID 信息。 |
| [`line: Int32`](field-line.md) | 获取行号信息。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 Position 实例，其中 `fileID`、`line`、`column` 成员变量均为 `0`。 |
| [`init(fileID: UInt32, line: Int32, column: Int32)`](init.md) | 构造一个 Position 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`dump(): Unit`](dump.md) | 将 Position 的信息打印出来。 |
| [`isEmpty(): Bool`](isempty.md) | 判断行号和列号是否同时为 `0`。 |
| [`toBytes(): Array<UInt8>`](tobytes.md) | Position 类型的序列化。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(r: Position): Bool`](operator-ne.md) | 比较两个 Position 实例是否不等。 |
| [`operator ==(r: Position): Bool`](operator-eq.md) | 比较两个 Position 实例是否相等。 |
