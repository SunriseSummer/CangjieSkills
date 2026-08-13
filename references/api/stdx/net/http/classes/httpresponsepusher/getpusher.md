<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httpresponsepusher.getpusher" parent="stdx.net.http.class.httpresponsepusher" -->
# HttpResponsePusher.getPusher

[← HttpResponsePusher](index.md)

## 签名

```cangjie role=signature
public static func getPusher(ctx: HttpContext): ?HttpResponsePusher
```

获取 HttpResponsePusher 实例，如果客户端拒绝推送，将返回 None。

## 契约

参数：

- ctx: HttpContext - Http 请求上下文。

返回值：

- ?HttpResponsePusher - 获得的 HttpResponsePusher。
