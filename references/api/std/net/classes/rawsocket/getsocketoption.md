<!-- cj-doc kind="api-member" level="6" id="std.net.class.rawsocket.getsocketoption" parent="std.net.class.rawsocket" -->
# RawSocket.getSocketOption

[← RawSocket](index.md)

## 签名

```cangjie role=signature
public unsafe func getSocketOption(level: Int32, option: Int32, value: CPointer<Byte>, len: CPointer<Int32>): Unit
```

获取套接字选项的值。

## 契约

参数：

- level: Int32 - 套接字选项级别。
- option: Int32 - 套接字选项名。
- value: CPointer\<Byte> - 套接字选项值。
- len: CPointer\<Int32> - 套接字选项值的长度。

异常：

- SocketException - 当前 RawSocket 实例已经关闭，或获取套接字选项失败时，抛出异常。
