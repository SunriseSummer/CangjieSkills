<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httprequestbuilder.url" parent="stdx.net.http.class.httprequestbuilder" -->
# HttpRequestBuilder.url

[← HttpRequestBuilder](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func url(String)

### 签名

```cangjie role=signature
public func url(rawUrl: String): HttpRequestBuilder
```

设置请求 url，默认 url 为空的 URL 对象。

### 契约

参数：

- rawUrl: String - 待解析成 url 对象的字符串，该字符串格式详见 URL.parse 函数。

返回值：

- HttpRequestBuilder - 当前 HttpRequestBuilder 实例的引用。

异常：

- IllegalArgumentException - 当被编码的字符不符合 UTF8 的字节序列规则时，抛出异常。
- UrlSyntaxException - 当传入字符串不符合 URL 格式时，抛出异常。

## func url(URL)

### 签名

```cangjie role=signature
public func url(url: URL): HttpRequestBuilder
```

设置请求 url，默认 url 为空的 URL 对象，即 URL.parse("")。

### 契约

参数：

- url: URL - URL 对象。

返回值：

- HttpRequestBuilder - 当前 HttpRequestBuilder 实例的引用。
