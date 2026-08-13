<!-- cj-doc kind="api-type" level="5" id="std.unittest.class.assertionctx" parent="std.unittest" -->
# AssertionCtx

[← std.unittest](../../index.md)

`AssertionCtx`

存储用户定义的断言的状态。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`args: String`](prop-args.md) | 返回以逗号分隔的未解析的用户定义断言参数的字符串。 |
| [`caller: String`](prop-caller.md) | 获取用户定义的断言函数的标识符。 |
| [`hasErrors: Bool`](prop-haserrors.md) | 如果用户定义内的任何断言失败，则为 `true` 。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`arg(key: String): String`](arg.md) | 返回表示原始传递的标识符的参数值的字符串表达，与参数列表中的标识符匹配。 |
| [`fail(message: String): Nothing`](fail.md) | 存储失败信息，在用户定义的断言函数中提供并抛出 `AssertExpection`。 |
| [`fail<PP>(pt: PP): Nothing where PP <: PrettyPrintable`](fail.md) | 存储失败信息，在用户定义的断言函数中提供并抛出 `AssertExpection`。 |
| [`failExpect(message: String): Unit`](failexpect.md) | 存储失败信息，在用户定义的断言函数内提供并继续函数执行。 |
| [`failExpect<PP>(pt: PP): Unit where PP <: PrettyPrintable`](failexpect.md) | 存储失败信息，在用户定义的断言函数内提供并继续函数执行。 |
| [`setArgsAliases(aliases: Array<String>): Unit`](setargsaliases.md) | 设置别名以通过函数 `arg` 访问未解析的用户定义的断言函数参数。 |
