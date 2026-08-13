<!-- cj-doc kind="api-member" level="6" id="std.net.struct.socketoptions.field-so_reuseport" parent="std.net.struct.socketoptions" -->
# SocketOptions.SO_REUSEPORT

[← SocketOptions](index.md)

## 签名

```cangjie role=signature
public static const SO_REUSEPORT: Int32
```

常数，用于将套接字选项的 `optname` 设为 `SO_REUSEPORT`。

## 契约

功能：常数，用于将套接字选项的 `optname` 设为 `SO_REUSEPORT`。不同系统下的值分别为：

- macOS: 0x0200
- Windows: 0xFFFF
- 其他情况：0x000F

类型：Int32
