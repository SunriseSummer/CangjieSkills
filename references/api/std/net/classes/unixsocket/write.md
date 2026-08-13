<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixsocket.write" parent="std.net.class.unixsocket" -->
# UnixSocket.write

[← UnixSocket](index.md)

## 签名

```cangjie role=signature
public override func write(buffer: Array<Byte>): Unit
```

读取写入。

## 契约

功能：读取写入。超时情况按 `writeTimeout` 决定，详见 `writeTimeout`。

参数：

- buffer: Array\<Byte> - 写入的数据存储变量。

异常：

- SocketException - 当 `buffer` 大小为 0 时抛出异常，当因系统原因写入失败时，抛出异常。
