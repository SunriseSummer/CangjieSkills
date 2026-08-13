<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.class.funchandler" parent="stdx.net.http" -->
# FuncHandler

[← stdx.net.http](../../index.md)

`FuncHandler <: HttpRequestHandler`

HttpRequestHandler 接口包装类，把单个函数包装成 HttpRequestHandler。

## 方法

| 签名 | 功能 |
|---|---|
| [`FuncHandler(let handler: (HttpContext) -> Unit)`](funchandler-httpcontext-unit.md) | FuncHandler 的构造函数。 |
| [`handle(ctx: HttpContext): Unit`](handle.md) | 处理 Http 请求。 |
