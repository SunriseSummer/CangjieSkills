<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.struct.httpstatuscode.field-status_continue" parent="stdx.net.http.struct.httpstatuscode" -->
# HttpStatusCode.STATUS_CONTINUE

[← HttpStatusCode](index.md)

## 签名

```cangjie role=signature
public static const STATUS_CONTINUE: UInt16 = 100
```

这个临时响应是用来通知客户端它的部分请求已经被服务器接收，且仍未被拒绝。

## 契约

类型：UInt16

> **说明：**
>
> 客户端应当继续发送请求的剩余部分，或者如果请求已经完成，忽略这个响应。
> 服务器必须在请求完成后向客户端发送一个最终响应。
