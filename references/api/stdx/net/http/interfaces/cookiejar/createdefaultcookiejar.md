<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.interface.cookiejar.createdefaultcookiejar" parent="stdx.net.http.interface.cookiejar" -->
# CookieJar.createDefaultCookieJar

[← CookieJar](index.md)

## 签名

```cangjie role=signature
static func createDefaultCookieJar(rejectPublicSuffixes: ArrayList<String>, isHttp: Bool): CookieJar
```

构建默认的管理 Cookie 的 CookieJar 实例。

## 契约

默认的 CookieJar 的管理要求参考 RFC 6265 5.3.。

参数：

- rejectPublicSuffixes: ArrayList\<String> - 用户配置的 public suffixes，Cookie 管理为了安全会拒绝 domain 值为 public suffixes 的 cookie（除非该 Cookie 来自于与 domain 相同的 host），public suffixes 见 PUBLIC SUFFIX LIST。
- isHttp: Bool - 该 CookieJar 是否用于 HTTP 协议，isHttp 为 true 则只会存储来自于 HTTP 协议的 Cookie。

返回值：

- CookieJar - 默认的 CookieJar 实例。
