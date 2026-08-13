<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixdatagramsocket.setsocketoption" parent="std.net.class.unixdatagramsocket" -->
# UnixDatagramSocket.setSocketOption

[← UnixDatagramSocket](index.md)

## 签名

```cangjie role=signature
public func setSocketOption(
    level: Int32,
    option: Int32,
    value: CPointer<Unit>,
    valueLength: UIntNative
): Unit
```

设置指定的套接字参数。

## 契约

参数：

- level: Int32 - 层级，例如 `SOL_SOCKET`。
- option: Int32 - 参数，例如 `SO_KEEPALIVE`。
- value: CPointer\<Unit> - 参数值。
- valueLength: UIntNative - 参数值长度。

异常：

- SocketException - 当 `setsockopt` 返回失败时，抛出异常。
