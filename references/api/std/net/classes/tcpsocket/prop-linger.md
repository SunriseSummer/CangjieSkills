<!-- cj-doc kind="api-member" level="6" id="std.net.class.tcpsocket.prop-linger" parent="std.net.class.tcpsocket" -->
# TcpSocket.linger

[← TcpSocket](index.md)

## 签名

```cangjie role=signature
public mut prop linger: ?Duration
```

设置和读取 `SO_LINGER` 属性，默认值取决于系统，`None` 表示禁用此选项。

## 契约

> **说明：**
>
> - 如果 `SO_LINGER` 被设置为 `Some(v)`，当套接字关闭时，如果还有等待的字节流，我们将在关闭连接前等待 `v` 时间，如果超过时间，字节流还未被发送，连接将会被异常终止（通过 RST 报文关闭）。
> - 如果 `SO_LINGER` 被设置为 `None`，当套接字关闭时，连接将被立即关闭，如果当前等待发送的字符，使用 FIN-ACK 关闭连接，当还有剩余待发送的字符时，使用 RST 关闭连接。

类型：?Duration

异常：

- IllegalArgumentException - 当超时时间小于 0 时，抛出异常。
