<!-- cj-doc kind="api-type" level="5" id="std.argopt.enum.argumentmode" parent="std.argopt" -->
# ArgumentMode

[← std.argopt](../../index.md)

`ArgumentMode <: ToString & Equatable<ArgumentMode>`

描述选项的参数模式。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`NoValue`](value-novalue.md) | 表示选项的值是不存在的。 |
| [`OptionalValue`](value-optionalvalue.md) | 选项值可省略；长选项只接受 `--option=value` 或 `--option`，短选项接受 `-ovalue` 或 `-o`。 |
| [`RequiredValue`](value-requiredvalue.md) | 表示选项的值是必须的。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toString(): String`](tostring.md) | 获取参数模式字符串。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator ==(that: ArgumentMode): Bool`](operator-eq.md) | 比较参数模式是否相同。 |
