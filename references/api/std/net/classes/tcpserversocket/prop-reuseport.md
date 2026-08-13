<!-- cj-doc kind="api-member" level="6" id="std.net.class.tcpserversocket.prop-reuseport" parent="std.net.class.tcpserversocket" -->
# TcpServerSocket.reusePort

[← TcpServerSocket](index.md)

## 签名

```cangjie role=signature
public mut prop reusePort: Bool
```

设置和读取 `SO_REUSEPORT` 属性。

## 契约

仅可在绑定前被修改。Windows 上可使用 `SO_REUSEADDR`，无该属性，抛出异常。
属性默认及配置生效后的行为取决于系统，使用前，请参阅不同系统针对此属性 `SO_REUSEPORT` 的说明文档。
同时开启 `SO_REUSEADDR/SO_REUSEPORT` 会导致不可预知的系统错误，用户需谨慎配置值。

类型：Bool

异常：

- SocketException - Windows 上不支持此类型，抛出异常。
