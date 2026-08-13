<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.struct.httpstatuscode.field-status_switching_protocols" parent="stdx.net.http.struct.httpstatuscode" -->
# HttpStatusCode.STATUS_SWITCHING_PROTOCOLS

[← HttpStatusCode](index.md)

## 签名

```cangjie role=signature
public static const STATUS_SWITCHING_PROTOCOLS: UInt16 = 101
```

服务器已经理解了客户端的请求，并将通过 Upgrade 消息头通知客户端采用不同的协议来完成这个请求。

## 契约

类型：UInt16

> **说明：**
>
> 在发送完这个响应最后的空行后，服务器将会切换到在 Upgrade 消息头中定义的那些协议。
