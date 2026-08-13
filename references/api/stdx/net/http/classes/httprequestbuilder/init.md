<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httprequestbuilder.init" parent="stdx.net.http.class.httprequestbuilder" -->
# HttpRequestBuilder.init

[← HttpRequestBuilder](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

构造一个新 HttpRequestBuilder。

## init(HttpRequest)

### 签名

```cangjie role=signature
public init(request: HttpRequest)
```

通过 request 构造一个具有 request 属性的 HttpRequestBuilder。

### 契约

功能： 通过 request 构造一个具有 request 属性的 HttpRequestBuilder。由于 body 成员是一个 InputStream，对原始的 request 的 body 的操作会影响到复制得到的 HttpRequest 的 body。HttpRequestBuilder 的 headers 和 trailers 是入参 request 的深拷贝。其余元素都是入参 request 的浅拷贝（因为是不可变对象，无需深拷贝）。

参数：

- request: HttpRequest - 传入的 HttpRequest 对象。
