<!-- cj-doc kind="api-member" level="6" id="std.net.class.udpsocket.prop-reuseport" parent="std.net.class.udpsocket" -->
# UdpSocket.reusePort

[← UdpSocket](index.md)

## 签名

```cangjie role=signature
public mut prop reusePort: Bool
```

设置和读取 `SO_REUSEPORT` 属性。

## 契约

Windows 上可使用 `SO_REUSEADDR`，但无 `SO_REUSEPORT` 属性，因此会抛出异常。
属性默认以及配置生效后的行为取决于系统，使用前，请参阅不同系统针对此属性 `SO_REUSEPORT` 的说明文档。

类型：Bool

异常：

- SocketException - Windows 上不支持此类型，抛出异常。
