<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.server.close" parent="stdx.net.http.class.server" -->
# Server.close

[← Server](index.md)

## 签名

```cangjie role=signature
public func close(): Unit
```

关闭服务器，服务器关闭后将不再对请求进行读取与处理，重复关闭将只有第一次生效（包括 close 和 closeGracefully）。
