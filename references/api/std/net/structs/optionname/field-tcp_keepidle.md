<!-- cj-doc kind="api-member" level="6" id="std.net.struct.optionname.field-tcp_keepidle" parent="std.net.struct.optionname" -->
# OptionName.TCP_KEEPIDLE

[← OptionName](index.md)

## 签名

```cangjie role=signature
public static const TCP_KEEPIDLE: Int32
```

用于设置在没有收到对端确认的情况下，`TCP` 保持连接最大次数的套接字选项。

## 契约

功能：用于设置在没有收到对端确认的情况下，`TCP` 保持连接最大次数的套接字选项。不同系统下的值分别为：

- macOS: 0x0010
- Windows: 0x0003
- 其他情况：0x0004

类型：Int32
