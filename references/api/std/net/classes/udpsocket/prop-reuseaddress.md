<!-- cj-doc kind="api-member" level="6" id="std.net.class.udpsocket.prop-reuseaddress" parent="std.net.class.udpsocket" -->
# UdpSocket.reuseAddress

[← UdpSocket](index.md)

## 签名

```cangjie role=signature
public mut prop reuseAddress: Bool
```

设置和读取 `SO_REUSEADDR` 属性。

## 契约

属性默认以及生效后的行为取决于系统，使用前，请参阅不同系统针对此属性 `SO_REUSEADDR/SOCK_REUSEADDR` 的说明文档。

类型：Bool
