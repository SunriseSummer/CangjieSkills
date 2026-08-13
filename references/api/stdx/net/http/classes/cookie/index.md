<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.class.cookie" parent="stdx.net.http" -->
# Cookie

[← stdx.net.http](../../index.md)

`Cookie`

HTTP 本身是无状态的，server 为了知道 client 的状态，提供个性化的服务，便可以通过 Cookie 来维护一个有状态的会话。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`cookieName: String`](prop-cookiename.md) | 获取 Cookie 对象的 cookie-name 值。 |
| [`cookieValue: String`](prop-cookievalue.md) | 获取 Cookie 对象的 cookie-value 值。 |
| [`domain: String`](prop-domain.md) | 获取 Cookie 对象的 domain-av 值。 |
| [`expires: ?DateTime`](prop-expires.md) | 获取 Cookie 对象的 expires-av 值。 |
| [`httpOnly: Bool`](prop-httponly.md) | 获取 Cookie 对象的 httpOnly-av 值。 |
| [`maxAge: ?Int64`](prop-maxage.md) | 获取 Cookie 对象的 max-age-av 值。 |
| [`others: ArrayList<String>`](prop-others.md) | 获取未被解析的属性。 |
| [`path: String`](prop-path.md) | 获取 Cookie 对象的 path-av 值。 |
| [`secure: Bool`](prop-secure.md) | 获取 Cookie 对象的 secure-av 值。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(name: String, value: String, expires!: ?DateTime = None, maxAge!: ?Int64 = None, domain!: String = "", path!: String = "", secure!: Bool = false, httpOnly!: Bool = false)`](init.md) | Cookie 构造器。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toSetCookieString(): String`](tosetcookiestring.md) | 提供将 Cookie 转成字符串形式的函数，方便 server 设置 `Set-Cookie` header。 |
