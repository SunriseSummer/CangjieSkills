<!-- cj-doc kind="api-member" level="6" id="std.net.struct.socketoptions.field-tcp_quickack" parent="std.net.struct.socketoptions" -->
# SocketOptions.TCP_QUICKACK

[← SocketOptions](index.md)

## 签名

```cangjie role=signature
public static const TCP_QUICKACK: Int32
```

常数，用于将套接字选项的 `optname` 设为 `TCP_QUICKACK`。

## 契约

功能：常数，用于将套接字选项的 `optname` 设为 `TCP_QUICKACK`。不同系统下的值分别为：

- macOS: 0xFFFF
- Windows: 0xFFFF
- 其他情况：0x000C

类型：Int32
