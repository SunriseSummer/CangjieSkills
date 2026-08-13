<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.interface.cookiejar" parent="stdx.net.http" -->
# CookieJar

[← stdx.net.http](../../index.md)

`CookieJar`

CookieJar 是 Client 用来管理 Cookie 的工具。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`isHttp: Bool`](prop-ishttp.md) | 该 CookieJar 是否用于 HTTP 协议。 |
| [`rejectPublicSuffixes: ArrayList<String>`](prop-rejectpublicsuffixes.md) | 获取 public suffixes 配置，该配置是一个 domain 黑名单，会拒绝 domain 值为 public suffixes 的 Cookie。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static createDefaultCookieJar(rejectPublicSuffixes: ArrayList<String>, isHttp: Bool): CookieJar`](createdefaultcookiejar.md) | 构建默认的管理 Cookie 的 CookieJar 实例。 |
| [`static parseSetCookieHeader(response: HttpResponse): ArrayList<Cookie>`](parsesetcookieheader.md) | 解析 response 中的 `Set-Cookie` header。 |
| [`static toCookieString(cookies: ArrayList<Cookie>): String`](tocookiestring.md) | 将 ArrayList<Cookie> 转成字符串，用于 Cookie header。 |
| [`clear(): Unit`](clear.md) | 清除全部 Cookie。 |
| [`getCookies(url: URL): ArrayList<Cookie>`](getcookies.md) | 从 CookieJar 中取出 ArrayList<Cookie>。 |
| [`removeCookies(domain: String): Unit`](removecookies.md) | 从 CookieJar 中移除某个 domain 的 Cookie。 |
| [`storeCookies(url: URL, cookies: ArrayList<Cookie>): Unit`](storecookies.md) | 将 ArrayList<Cookie> 存进 CookieJar。 |
