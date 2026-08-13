<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httpresponsebuilder.body" parent="stdx.net.http.class.httpresponsebuilder" -->
# HttpResponseBuilder.body

[← HttpResponseBuilder](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## func body(Array<UInt8>)

### 签名

```cangjie role=signature
public func body(body: Array<UInt8>): HttpResponseBuilder
```

设置响应 body，如果已经设置过，调用该函数将替换原 body。

### 契约

参数：

- body: Array\<UInt8> - 字节数组形式的响应体。

返回值：

- HttpResponseBuilder - 当前 HttpResponseBuilder 实例的引用。

## func body(InputStream)

### 签名

```cangjie role=signature
public func body(body: InputStream): HttpResponseBuilder
```

设置响应 body，如果已经设置过，调用该函数将替换原 body 调用该函数设置请求 body。

### 契约

参数：

- body: InputStream - 流形式的响应体。

返回值：

- HttpResponseBuilder - 当前 HttpResponseBuilder 实例的引用。

## func body(String)

### 签名

```cangjie role=signature
public func body(body: String): HttpResponseBuilder
```

设置响应 body，如果已经设置过，调用该函数将替换原 body 调用该函数设置请求 body。

### 契约

参数：

- body: String - 字符串形式的响应体。

返回值：

- HttpResponseBuilder - 当前 HttpResponseBuilder 实例的引用。
