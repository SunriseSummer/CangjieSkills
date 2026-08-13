<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.interface.cookiejar.tocookiestring" parent="stdx.net.http.interface.cookiejar" -->
# CookieJar.toCookieString

[← CookieJar](index.md)

## 签名

```cangjie role=signature
static func toCookieString(cookies: ArrayList<Cookie>): String
```

将 ArrayList<Cookie> 转成字符串，用于 Cookie header。

## 契约

该函数会将传入的 ArrayList\<Cookie> 数组转成协议规定的 Cookie header 的字符串形式，见 RFC 6265 5.4.4.。

参数：

- cookies: ArrayList\<Cookie> - 所需转成 Cookie header 字符串的 ArrayList\<Cookie>。

返回值：

- String - 用于 Cookie header 的字符串。
