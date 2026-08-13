<!-- cj-doc kind="api-member" level="6" id="std.net.class.tcpsocket.prop-nodelay" parent="std.net.class.tcpsocket" -->
# TcpSocket.noDelay

[← TcpSocket](index.md)

## 签名

```cangjie role=signature
public mut prop noDelay: Bool
```

设置和读取 `TCP_NODELAY` 属性，默认为 `true`。

## 契约

这个选项将禁用 Nagel 算法，所有写入字节被无延迟得转发。当属性设置为 `false` 时，Nagel 算法将在发包前引入延时时间。

类型：Bool
