<!-- cj-doc kind="api-member" level="6" id="std.net.class.rawsocket.setsocketoption" parent="std.net.class.rawsocket" -->
# RawSocket.setSocketOption

[← RawSocket](index.md)

## 签名

```cangjie role=signature
public unsafe func setSocketOption(level: Int32, option: Int32, value: CPointer<Byte>, len: Int32): Unit
```

设置套接字选项。

## 契约

参数：

- level: Int32 - 套接字选项级别。
- option: Int32 - 套接字选项名。
- value: CPointer\<Byte> - 套接字选项值。
- len: Int32 - 套接字选项值的长度。

异常：

- SocketException - 当前 RawSocket 实例已经关闭，或设置套接字选项失败时，抛出异常。
