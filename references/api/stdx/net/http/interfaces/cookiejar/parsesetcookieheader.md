<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.interface.cookiejar.parsesetcookieheader" parent="stdx.net.http.interface.cookiejar" -->
# CookieJar.parseSetCookieHeader

[← CookieJar](index.md)

## 签名

```cangjie role=signature
static func parseSetCookieHeader(response: HttpResponse): ArrayList<Cookie>
```

解析 response 中的 `Set-Cookie` header。

## 契约

该函数解析 response 中的 `Set-Cookie` header，并返回解析出的 ArrayList\<Cookie>，解析 `Set-Cookie` header 的具体规则见 RFC 6265 5.2.。

参数：

- response: HttpResponse - 所需要解析的 response。

返回值：

- ArrayList\<Cookie> - 从 response 中解析出的 ArrayList\<Cookie> 数组。
