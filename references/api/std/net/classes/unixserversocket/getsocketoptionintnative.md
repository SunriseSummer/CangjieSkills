<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixserversocket.getsocketoptionintnative" parent="std.net.class.unixserversocket" -->
# UnixServerSocket.getSocketOptionIntNative

[← UnixServerSocket](index.md)

## 签名

```cangjie role=signature
public func getSocketOptionIntNative(
    level: Int32,
    option: Int32
): IntNative
```

获取返回值为整型的套接字参数。

## 契约

参数：

- level: Int32 - 层级，例如 `SOL_SOCKET`。
- option: Int32 - 参数，例如 `SO_KEEPALIVE`。

返回值：

- IntNative - 指定的套接字参数值。

异常：

- SocketException - 当 `getsockopt` 返回失败时或参数大小超过 IntNative 的阈值时，抛出异常。
