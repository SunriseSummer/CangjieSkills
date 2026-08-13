<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixdatagramsocket.init" parent="std.net.class.unixdatagramsocket" -->
# UnixDatagramSocket.init

[← UnixDatagramSocket](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init(SocketAddress)

### 签名

```cangjie role=signature
public init(bindAt!: SocketAddress)
```

创建一个未连接的 UnixDatagramSocket 实例。

### 契约

此文件类型可通过 isSock() 判断是否存在，可通过 unlink() 接口删除。

参数：

- bindAt!: SocketAddress - 连接的套接字地址。地址应当不存在，在 `bind` 时会创建。

异常：

- SocketException - 当路径为空或已存在时，抛出异常。

## init(String)

### 签名

```cangjie role=signature
public init(bindAt!: String)
```

创建一个未连接的 UnixDatagramSocket 实例。

### 契约

此文件类型可通过 isSock() 判断是否存在，可通过 unlink() 接口删除。

参数：

- bindAt!: String - 连接的文件地址。文件地址应当不存在，在 `bind` 时会创建。

异常：

- IllegalArgumentException - 当文件地址不合法时，抛出异常。
- SocketException - 当文件地址为空或已存在时，抛出异常。
