<!-- cj-doc kind="api-type" level="5" id="stdx.encoding.url.class.userinfo" parent="stdx.encoding.url" -->
# UserInfo

[← stdx.encoding.url](../../index.md)

`UserInfo <: ToString`

UserInfo 表示 URL 中用户名和密码信息。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 创建 UserInfo 实例。 |
| [`init(userName: String)`](init.md) | 根据用户名创建 UserInfo 实例。 |
| [`init(userName: String, passWord: Option<String>)`](init.md) | 根据用户名和密码创建 UserInfo 实例。 |
| [`init(userName: String, passWord: String)`](init.md) | 根据用户名和密码创建 UserInfo 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`password(): Option<String>`](password.md) | 获取密码信息。 |
| [`toString(): String`](tostring.md) | 将当前 UserInfo 实例转换为字符串。 |
| [`username(): String`](username.md) | 获取用户名信息。 |
