<!-- cj-doc kind="api-member" level="6" id="std.net.struct.socketoptions.field-so_linger" parent="std.net.struct.socketoptions" -->
# SocketOptions.SO_LINGER

[← SocketOptions](index.md)

## 签名

```cangjie role=signature
public static const SO_LINGER: Int32
```

常数，用于将套接字选项的 `optname` 设为 `SO_LINGER`。

## 契约

功能：常数，用于将套接字选项的 `optname` 设为 `SO_LINGER`。不同系统下的值分别为：

- macOS: 0x0080
- Windows: 0x0080
- 其他情况：0x000D

类型：Int32
