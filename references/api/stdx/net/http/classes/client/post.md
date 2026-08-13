<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.client.post" parent="stdx.net.http.class.client" -->
# Client.post

[← Client](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## func post(String, Array<UInt8>)

### 签名

```cangjie role=signature
public func post(url: String, body: Array<UInt8>): HttpResponse
```

请求方法为 POST 的便捷请求函数。

### 契约

参数：

- url: String - 请求的 url。
- body: Array\<UInt8> - 请求体。

返回值：

- HttpResponse - 服务端返回的响应。

异常：

- UrlSyntaxException - 当参数 url 不符合 URL 解析规范时，抛出异常。
- IllegalArgumentException - 当被编码的字符不符合 UTF-8 的字节序列规则时，抛出异常。
- 其余同 func send。

## func post(String, InputStream)

### 签名

```cangjie role=signature
public func post(url: String, body: InputStream): HttpResponse
```

请求方法为 POST 的便捷请求函数。

### 契约

参数：

- url: String - 请求的 url。
- body: InputStream - 请求体。

返回值：

- HttpResponse - 服务端返回的响应。

异常：

- UrlSyntaxException - 当参数 url 不符合 URL 解析规范时，抛出异常。
- IllegalArgumentException - 当被编码的字符不符合 UTF-8 的字节序列规则时，抛出异常。
- 其余同 func send。

## func post(String, String)

### 签名

```cangjie role=signature
public func post(url: String, body: String): HttpResponse
```

请求方法为 POST 的便捷请求函数。

### 契约

参数：

- url: String - 请求的 url。
- body: String - 请求体。

返回值：

- HttpResponse - 服务端返回的响应。

异常：

- UrlSyntaxException - 当参数 url 不符合 URL 解析规范时，抛出异常。
- IllegalArgumentException - 当被编码的字符不符合 UTF-8 的字节序列规则时，抛出异常。
- 其余同 func send。
