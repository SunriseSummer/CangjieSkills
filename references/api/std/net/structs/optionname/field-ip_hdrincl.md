<!-- cj-doc kind="api-member" level="6" id="std.net.struct.optionname.field-ip_hdrincl" parent="std.net.struct.optionname" -->
# OptionName.IP_HDRINCL

[← OptionName](index.md)

## 签名

```cangjie role=signature
public static const IP_HDRINCL: Int32
```

用于在发送数据包时指定 IP 头部是否由应用程序提供的套接字选项。

## 契约

功能：用于在发送数据包时指定 IP 头部是否由应用程序提供的套接字选项。不同系统下的值分别为：

- macOS: 0x0002
- Windows: 0x0002
- 其他情况：0x0003

类型：Int32
