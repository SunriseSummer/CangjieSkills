<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixsocketaddress.init" parent="std.net.class.unixsocketaddress" -->
# UnixSocketAddress.init

[← UnixSocketAddress](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init(Array<Byte>)

### 签名

```cangjie role=signature
public init(path: Array<Byte>)
```

根据 Array<Byte> 表示的文件系统路径构造 UnixSocketAddress 地址。

### 契约

参数：

- path: Array\<Byte>  - 文件系统路径字节数组。

异常：

- IllegalArgumentException - 如果 address 不合法，抛出异常。

## init(String)

### 签名

```cangjie role=signature
public init(path: String)
```

根据字符串表示的文件系统路径构造 UnixSocketAddress 地址。

### 契约

参数：

- path: String - 文件系统路径字符串。

异常：

- IllegalArgumentException - 如果 address 不合法，抛出异常。
