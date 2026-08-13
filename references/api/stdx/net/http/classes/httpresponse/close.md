<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httpresponse.close" parent="stdx.net.http.class.httpresponse" -->
# HttpResponse.close

[← HttpResponse](index.md)

## 签名

```cangjie role=signature
public func close(): Unit
```

如果用户不再需要未读完的 body 数据，可以调用此接口关闭连接以释放资源。

## 契约

功能：如果用户不再需要未读完的 body 数据，可以调用此接口关闭连接以释放资源。如果是 HTTP/2 协议，会发送一个 Reset 帧关闭对应的流。

> **注意：**
>
> 如果使用者已读完 body，无需调用此接口再释放资源。
