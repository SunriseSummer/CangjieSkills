<!-- cj-doc kind="api-member" level="6" id="std.net.class.rawsocket.init" parent="std.net.class.rawsocket" -->
# RawSocket.init

[← RawSocket](index.md)

## 签名

```cangjie role=signature
public init(domain: SocketDomain, `type`: SocketType, protocol: ProtocolType)
```

创建特定通信域、类型、协议组合的套接字。

## 契约

参数：

- domain: SocketDomain - 通信域。
- \`type`: SocketType - 套接字类型。
- protocol: ProtocolType - 协议类型。

异常：

- SocketException - 当通信域、类型、协议组合无法创建套接字时，抛出异常。
