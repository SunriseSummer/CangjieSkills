<!-- cj-doc kind="api-member" level="6" id="std.net.class.tcpserversocket.prop-reuseaddress" parent="std.net.class.tcpserversocket" -->
# TcpServerSocket.reuseAddress

[← TcpServerSocket](index.md)

## 签名

```cangjie role=signature
public mut prop reuseAddress: Bool
```

设置和读取 `SO_REUSEADDR` 属性，默认设置为 `true`。

## 契约

属性生效后的行为取决于系统，使用前，请参阅不同系统针对此属性 `SO_REUSEADDR/SOCK_REUSEADDR` 的说明文档。

类型：Bool
