<!-- cj-doc kind="api-member" level="6" id="std.net.class.tcpserversocket.getsocketoptionbool" parent="std.net.class.tcpserversocket" -->
# TcpServerSocket.getSocketOptionBool

[← TcpServerSocket](index.md)

## 签名

```cangjie role=signature
public func getSocketOptionBool(
    level: Int32,
    option: Int32
): Bool
```

获取指定的套接字参数。

## 契约

功能：获取指定的套接字参数。从 IntNative 强转而来。`0 => false`，非 `0 => true`。

参数：

- level: Int32 - 层级，例如 `SOL_SOCKET`。
- option: Int32 - 参数，例如 `SO_KEEPALIVE`。

返回值：

- Bool - 指定的套接字参数。从 IntNative 强转而来。`0 => false`，非 `0 => true`。

异常：

- SocketException - 当 `getsockopt` 返回失败时或参数大小超过 IntNative 的阈值时，抛出异常。
