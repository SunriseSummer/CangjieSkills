<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.client.options" parent="stdx.net.http.class.client" -->
# Client.options

[← Client](index.md)

## 签名

```cangjie role=signature
public func options(url: String): HttpResponse
```

请求方法为 OPTIONS 的便捷请求函数。

## 契约

参数：

- url: String - 请求的 url。

返回值：

- HttpResponse - 服务端返回的响应。

异常：

- UrlSyntaxException - 当参数 url 不符合 URL 解析规范时，抛出异常。
- IllegalArgumentException - 当被编码的字符不符合 UTF-8 的字节序列规则时，抛出异常。
- 其余同 func send。
