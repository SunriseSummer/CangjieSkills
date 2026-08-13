<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.interface.cookiejar.getcookies" parent="stdx.net.http.interface.cookiejar" -->
# CookieJar.getCookies

[← CookieJar](index.md)

## 签名

```cangjie role=signature
func getCookies(url: URL): ArrayList<Cookie>
```

从 CookieJar 中取出 ArrayList<Cookie>。

## 契约

> 默认实现 cookieJarImpl 的取 ArrayList\<Cookie> 函数的具体要求见 RFC 6265 5.4.，对取出的 ArrayList\<Cookie> 调用 toCookieString 可以将取出的 ArrayList\<Cookie> 转成 Cookie header 的 value 字符串。

参数：

- url: URL - 所要取出 ArrayList\<Cookie> 的 url。

返回值：

- ArrayList\<Cookie> - CookieJar 中存储的对应此 url 的 ArrayList\<Cookie>。
