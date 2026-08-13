<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httpresponsewriter.write" parent="stdx.net.http.class.httpresponsewriter" -->
# HttpResponseWriter.write

[← HttpResponseWriter](index.md)

## 签名

```cangjie role=signature
public func write(buf: Array<Byte>): Unit
```

发送 buf 中数据到客户端。

## 契约

参数：

- buf: Array\<Byte> - 要发送的数据。

异常：

- HttpException - 请求方法为 "HEAD" 或响应状态码为 "1XX\204\304"。
- HttpException - 连接关闭。
- HttpException - response 协议版本为 HTTP/1.0。
- HttpException - 响应连接已升级为 WebSocket。
