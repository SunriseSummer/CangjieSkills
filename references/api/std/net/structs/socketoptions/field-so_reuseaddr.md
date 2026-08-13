<!-- cj-doc kind="api-member" level="6" id="std.net.struct.socketoptions.field-so_reuseaddr" parent="std.net.struct.socketoptions" -->
# SocketOptions.SO_REUSEADDR

[← SocketOptions](index.md)

## 签名

```cangjie role=signature
public static const SO_REUSEADDR: Int32
```

常数，用于将套接字选项的 `optname` 设为 `SO_REUSEADDR`。

## 契约

功能：常数，用于将套接字选项的 `optname` 设为 `SO_REUSEADDR`。不同系统下的值分别为：

- macOS: 0x0004
- Windows: 0x0004
- 其他情况：0x0002

类型：Int32
