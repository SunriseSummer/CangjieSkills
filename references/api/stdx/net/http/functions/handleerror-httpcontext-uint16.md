<!-- cj-doc kind="api-member" level="5" id="stdx.net.http.func.handleerror-httpcontext-uint16" parent="stdx.net.http" -->
# handleError(HttpContext, UInt16)

[← stdx.net.http](../index.md)

## 签名

```cangjie role=signature
public func handleError(ctx: HttpContext, code: UInt16): Unit
```

便捷的 Http 请求处理函数，用于回复错误请求。

## 契约

参数：

- ctx: HttpContext - Http 请求上下文。
- code: UInt16 - Http 响应码。
