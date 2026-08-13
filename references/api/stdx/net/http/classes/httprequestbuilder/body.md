<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httprequestbuilder.body" parent="stdx.net.http.class.httprequestbuilder" -->
# HttpRequestBuilder.body

[← HttpRequestBuilder](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## func body(Array<UInt8>)

### 签名

```cangjie role=signature
public func body(body: Array<UInt8>): HttpRequestBuilder
```

设置请求 body。

### 契约

功能：设置请求 body。如果已经设置过，调用该函数将替换原 body。

参数：

- body: Array\<UInt8> - 字节数组形式的请求体。

返回值：

- HttpRequestBuilder - 当前 HttpRequestBuilder 实例的引用。

## func body(InputStream)

### 签名

```cangjie role=signature
public func body(body: InputStream): HttpRequestBuilder
```

设置请求 body。

### 契约

功能：设置请求 body。如果已经设置过，调用该函数将替换原 body。

参数：

- body: InputStream - 流形式的请求体。

返回值：

- HttpRequestBuilder - 当前 HttpRequestBuilder 实例的引用。

## func body(String)

### 签名

```cangjie role=signature
public func body(body: String): HttpRequestBuilder
```

设置请求 body，如果已经设置过，调用该函数将替换原 body 调用该函数设置请求 body，则 body 将以内置的 InputStream 实现类表示，其大小已知。

### 契约

参数：

- body: String - 字符串形式的请求体。

返回值：

- HttpRequestBuilder - 当前 HttpRequestBuilder 实例的引用。
