<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.clientbuilder.autoredirect" parent="stdx.net.http.class.clientbuilder" -->
# ClientBuilder.autoRedirect

[← ClientBuilder](index.md)

## 签名

```cangjie role=signature
public func autoRedirect(auto: Bool): ClientBuilder
```

配置客户端是否会自动进行重定向。

## 契约

功能：配置客户端是否会自动进行重定向。重定向会请求 Location 头的资源，协议规定，Location 只能包含一个 URI 引用 Location = URI-reference，详见 RFC 9110 10.2.2.。304 状态码默认不重定向。

参数：

- auto: Bool - 默认值为 true，即开启自动重定向。

返回值：

- ClientBuilder - 当前 ClientBuilder 实例的引用。
