<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.interface.protocolservicefactory.create" parent="stdx.net.http.interface.protocolservicefactory" -->
# ProtocolServiceFactory.create

[← ProtocolServiceFactory](index.md)

## 签名

```cangjie role=signature
func create(protocol: Protocol, socket: StreamingSocket): ProtocolService
```

根据协议创建协议服务实例。

## 契约

参数：

- protocol: Protocol - 协议版本，如  HTTP1_0、 HTTP1_1、 HTTP2_0。
- socket: StreamingSocket - 来自客户端的套接字。

返回值：

- ProtocolService - 协议服务实例。
