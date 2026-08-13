<!-- cj-doc kind="api-member" level="6" id="std.net.struct.optionname.field-ip_ttl" parent="std.net.struct.optionname" -->
# OptionName.IP_TTL

[← OptionName](index.md)

## 签名

```cangjie role=signature
public static const IP_TTL: Int32
```

用于限制 IP 数据包在网络中传输最大跳数的套接字选项。

## 契约

功能：用于限制 IP 数据包在网络中传输最大跳数的套接字选项。不同系统下的值分别为：

- macOS: 0x0004
- Windows: 0x0004
- 其他情况：0x0002

类型：Int32
