<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.clientbuilder.cookiejar" parent="stdx.net.http.class.clientbuilder" -->
# ClientBuilder.cookieJar

[← ClientBuilder](index.md)

## 签名

```cangjie role=signature
public func cookieJar(cookieJar: ?CookieJar): ClientBuilder
```

用于存储客户端所有 Cookie。

## 契约

参数：

- cookieJar: ?CookieJar - 默认使用一个空的 CookieJar，如果配置为 None 则不会启用 Cookie。

返回值：

- ClientBuilder - 当前 ClientBuilder 实例的引用。
