<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixsocket.init" parent="std.net.class.unixsocket" -->
# UnixSocket.init

[← UnixSocket](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init(SocketAddress, ?SocketAddress)

### 签名

```cangjie role=signature
public init(address: SocketAddress, localAddress!: ?SocketAddress = None)
```

创建一个未连接的 UnixSocket 实例。

### 契约

参数：

- address: SocketAddress - 连接的套接字地址。
- localAddress!: ?SocketAddress - 需要 bind 的本地套接字地址；默认值为 `None`。

## init(String, ?String)

### 签名

```cangjie role=signature
public init(path: String, localPath!: ?String = None)
```

创建一个未连接的 UnixSocket 实例。

### 契约

此文件类型可通过 isSock() 判断是否存在，可通过 unlink() 接口删除。

参数：

- path: String - 连接的文件地址。
- localPath!: ?String - 需要 bind 的本地套接字地址路径；默认值为 `None`。

异常：

- IllegalArgumentException - 当文件地址不合法时，抛出异常。
