<!-- cj-doc kind="api-member" level="6" id="std.net.class.tcpserversocket.prop-backlogsize" parent="std.net.class.tcpserversocket" -->
# TcpServerSocket.backlogSize

[← TcpServerSocket](index.md)

## 签名

```cangjie role=signature
public mut prop backlogSize: Int64
```

设置和读取 `backlog` 大小。

## 契约

仅可在调用 `bind` 前调用，否则将抛出异常。
变量是否生效取决于系统行为。

类型：Int64

异常：

- SocketException - 当在 `bind` 后调用时，抛出异常。
