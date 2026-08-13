<!-- cj-doc kind="api-member" level="6" id="std.net.class.tcpsocket.setsocketoptionbool" parent="std.net.class.tcpsocket" -->
# TcpSocket.setSocketOptionBool

[← TcpSocket](index.md)

## 签名

```cangjie role=signature
public func setSocketOptionBool(
    level: Int32,
    option: Int32,
    value: Bool
): Unit
```

设置指定的套接字参数。

## 契约

参数：

- level: Int32 - 层级，例如 `SOL_SOCKET`。
- option: Int32 - 参数，例如 `SO_KEEPALIVE`。
- value: Bool - 参数值。

异常：

- SocketException - 当 `setsockopt` 返回失败时，抛出异常。
