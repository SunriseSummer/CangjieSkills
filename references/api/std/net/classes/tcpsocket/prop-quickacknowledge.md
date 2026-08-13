<!-- cj-doc kind="api-member" level="6" id="std.net.class.tcpsocket.prop-quickacknowledge" parent="std.net.class.tcpsocket" -->
# TcpSocket.quickAcknowledge

[← TcpSocket](index.md)

## 签名

```cangjie role=signature
public mut prop quickAcknowledge: Bool
```

设置和读取 `TCP_QUICKACK` 属性，默认为 `false`。

## 契约

这个选项类似于 `noDelay`，但仅影响 TCP ACK 和第一次响应。不支持 Windows 和 macOS 系统。

类型：Bool
