<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.interface.cookiejar.storecookies" parent="stdx.net.http.interface.cookiejar" -->
# CookieJar.storeCookies

[← CookieJar](index.md)

## 签名

```cangjie role=signature
func storeCookies(url: URL, cookies: ArrayList<Cookie>): Unit
```

将 ArrayList<Cookie> 存进 CookieJar。

## 契约

如果往 CookieJar 中存 Cookie 时超过了上限（3000 条），那么至少清除 CookieJar 中 1000 条 Cookie 再往里存储。清除 CookieJar 中 Cookie 的优先级见 RFC 6265 5.3.12.。

Cookie 按如下顺序清除：

- 过期的 Cookie；
- 相同 domain 中超过 50 条以上的部分；
- 所有 Cookie 具有相同优先级的 Cookie 则优先删除 `last-access` 属性更早的。

参数：

- url: URL - 产生该 Cookie 的 url。
- cookies: ArrayList\<Cookie> - 需要存储的 ArrayList\<Cookie>。
