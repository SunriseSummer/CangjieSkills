<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixserversocket.init" parent="std.net.class.unixserversocket" -->
# UnixServerSocket.init

[← UnixServerSocket](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init(SocketAddress)

### 签名

```cangjie role=signature
public init(bindAt!: SocketAddress)
```

创建一个未连接的 UnixServerSocket 实例。

### 契约

参数：

- bindAt!: SocketAddress - 连接的套接字地址。

## init(String)

### 签名

```cangjie role=signature
public init(bindAt!: String)
```

创建一个未连接的 UnixServerSocket 实例。

### 契约

此文件类型可通过 isSock() 判断是否存在，可通过 unlink() 接口删除。

参数：

- bindAt!: String - 连接的文件地址。

异常：

- IllegalArgumentException - 当文件地址不合法时，抛出异常。
