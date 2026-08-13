<!-- cj-doc kind="api-member" level="6" id="std.net.struct.socketoptions.field-so_sndbuf" parent="std.net.struct.socketoptions" -->
# SocketOptions.SO_SNDBUF

[← SocketOptions](index.md)

## 签名

```cangjie role=signature
public static const SO_SNDBUF: Int32
```

常数，用于将套接字选项的 `optname` 设为 `SO_SNDBUF`。

## 契约

功能：常数，用于将套接字选项的 `optname` 设为 `SO_SNDBUF`。不同系统下的值分别为：

- macOS: 0x1001
- Windows: 0x1001
- 其他情况：0x0007

类型：Int32
