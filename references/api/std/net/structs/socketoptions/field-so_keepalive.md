<!-- cj-doc kind="api-member" level="6" id="std.net.struct.socketoptions.field-so_keepalive" parent="std.net.struct.socketoptions" -->
# SocketOptions.SO_KEEPALIVE

[← SocketOptions](index.md)

## 签名

```cangjie role=signature
public static const SO_KEEPALIVE: Int32
```

常数，用于将套接字选项的 `optname` 设为 `SO_KEEPALIVE`。

## 契约

功能：常数，用于将套接字选项的 `optname` 设为 `SO_KEEPALIVE`。不同系统下的值分别为：

- macOS: 0x0008
- Windows: 0x0008
- 其他情况：0x0009

类型：Int32
