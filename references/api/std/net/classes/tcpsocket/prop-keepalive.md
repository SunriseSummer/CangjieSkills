<!-- cj-doc kind="api-member" level="6" id="std.net.class.tcpsocket.prop-keepalive" parent="std.net.class.tcpsocket" -->
# TcpSocket.keepAlive

[← TcpSocket](index.md)

## 签名

```cangjie role=signature
public mut prop keepAlive: ?SocketKeepAliveConfig
```

设置和读取保活属性，`None` 表示关闭保活。

## 契约

用户未设置时将使用系统默认配置。设置此配置可能会被延迟或被系统忽略，取决于系统的处理能力。

类型：?SocketKeepAliveConfig
