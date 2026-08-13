<!-- cj-doc kind="api-member" level="5" id="stdx.net.http.func.upgrade-httpcontext" parent="stdx.net.http" -->
# upgrade(HttpContext)

[← stdx.net.http](../index.md)

## 签名

```cangjie role=signature
public func upgrade(ctx: HttpContext): StreamingSocket
```

在 handler 内获取 StreamingSocket，可用于支持协议升级和处理 CONNECT 请求。

## 契约

> - 调用该函数时，将首先根据 ctx.responseBuilder 发送响应，仅发送状态码和响应头。
> - 调用该函数时，将把 ctx.request.body 置空，后续无法通过 body.read(...) 读数据，未读完的 body 数据将留存在返回的 StreamingSocket 中。

参数：

- ctx: HttpContext - 请求上下文。

返回值：

- StreamingSocket - 底层连接（对于 HTTP/2 是一个 stream），可用于后续读写。

异常：

- HttpException - 获取底层连接（对于 HTTP/2 是一个 stream）失败。
