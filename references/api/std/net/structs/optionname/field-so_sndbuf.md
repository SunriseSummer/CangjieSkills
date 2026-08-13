<!-- cj-doc kind="api-member" level="6" id="std.net.struct.optionname.field-so_sndbuf" parent="std.net.struct.optionname" -->
# OptionName.SO_SNDBUF

[← OptionName](index.md)

## 签名

```cangjie role=signature
public static const SO_SNDBUF: Int32
```

用于设置套接字发送缓冲区大小的套接字选项。

## 契约

功能：用于设置套接字发送缓冲区大小的套接字选项。不同系统下的值分别为：

- macOS: 0x1001
- Windows: 0x1001
- 其他情况：0x0007

类型：Int32
