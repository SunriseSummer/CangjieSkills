<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.redirecthandler.init" parent="stdx.net.http.class.redirecthandler" -->
# RedirectHandler.init

[← RedirectHandler](index.md)

## 签名

```cangjie role=signature
public init(url: String, code: UInt16)
```

RedirectHandler 的构造函数。

## 契约

参数：

- url: String - 重定向响应中 Location 头部的 url。
- code: UInt16 - 重定向响应的响应码。

异常：

- HttpException - url 为空或响应码不是除 304 以外的 3XX 状态码时抛出异常。
