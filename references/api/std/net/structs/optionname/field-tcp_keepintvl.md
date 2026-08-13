<!-- cj-doc kind="api-member" level="6" id="std.net.struct.optionname.field-tcp_keepintvl" parent="std.net.struct.optionname" -->
# OptionName.TCP_KEEPINTVL

[← OptionName](index.md)

## 签名

```cangjie role=signature
public static const TCP_KEEPINTVL: Int32
```

用于设置 `TCP` 保持连接时发送探测报文时间间隔的套接字选项。

## 契约

功能：用于设置 `TCP` 保持连接时发送探测报文时间间隔的套接字选项。不同系统下的值分别为：

- macOS: 0x0101
- Windows: 0x0011
- 其他情况：0x0005

类型：Int32
