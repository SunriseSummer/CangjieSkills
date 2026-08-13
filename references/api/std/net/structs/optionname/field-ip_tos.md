<!-- cj-doc kind="api-member" level="6" id="std.net.struct.optionname.field-ip_tos" parent="std.net.struct.optionname" -->
# OptionName.IP_TOS

[← OptionName](index.md)

## 签名

```cangjie role=signature
public static const IP_TOS: Int32
```

用于指定数据包服务类型和优先级的套接字选项。

## 契约

功能：用于指定数据包服务类型和优先级的套接字选项。不同系统下的值分别为：

- macOS: 0x0003
- Windows: 0x0003
- 其他情况：0x0001

类型：Int32
