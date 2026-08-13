<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.interface.httprequestdistributor.register" parent="stdx.net.http.interface.httprequestdistributor" -->
# HttpRequestDistributor.register

[← HttpRequestDistributor](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func register(String, (HttpContext) -> Unit)

### 签名

```cangjie role=signature
func register(path: String, handler: (HttpContext) -> Unit): Unit
```

注册请求处理器。

### 契约

参数：

- path: String - 请求路径。
- handler: (HttpContext) ->Unit - 请求处理函数。

异常：

- HttpException - 请求路径已注册请求处理器。

## func register(String, HttpRequestHandler)

### 签名

```cangjie role=signature
func register(path: String, handler: HttpRequestHandler): Unit
```

注册请求处理器。

### 契约

参数：

- path: String - 请求路径。
- handler: HttpRequestHandler - 请求处理器。

异常：

- HttpException - 请求路径已注册请求处理器。
