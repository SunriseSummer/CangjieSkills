<!-- cj-doc kind="api-member" level="6" id="std.net.struct.socketdomain.field-unix" parent="std.net.struct.socketdomain" -->
# SocketDomain.UNIX

[← SocketDomain](index.md)

## 签名

```cangjie role=signature
public static let UNIX: SocketDomain
```

本机通信。

## 契约

功能：本机通信。不同系统下的值分别为：

- Windows: SocketDomain(0)
- 其他情况：SocketDomain(1)

类型：SocketDomain
