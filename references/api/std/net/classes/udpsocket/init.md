<!-- cj-doc kind="api-member" level="6" id="std.net.class.udpsocket.init" parent="std.net.class.udpsocket" -->
# UdpSocket.init

[← UdpSocket](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init(SocketAddress)

### 签名

```cangjie role=signature
public init(bindAt!: SocketAddress)
```

创建一个未绑定的 `UdpSocket` 实例。

### 契约

参数：

- bindAt!: SocketAddress - 绑定地址及端口。

异常：

- IllegalArgumentException - 当超时时间小于 0 时，抛出异常。

## init(UInt16)

### 签名

```cangjie role=signature
public init(bindAt!: UInt16)
```

创建一个未绑定的 `UdpSocket` 实例。

### 契约

参数：

- bindAt!: UInt16 - 绑定端口。
