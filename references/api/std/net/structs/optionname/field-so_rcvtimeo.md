<!-- cj-doc kind="api-member" level="6" id="std.net.struct.optionname.field-so_rcvtimeo" parent="std.net.struct.optionname" -->
# OptionName.SO_RCVTIMEO

[← OptionName](index.md)

## 签名

```cangjie role=signature
public static const SO_RCVTIMEO: Int32
```

用于设置套接字接收数据超时时间的套接字选项。

## 契约

功能：用于设置套接字接收数据超时时间的套接字选项。不同系统下的值分别为：

- macOS: 0x1006
- Windows: 0x1006
- 其他情况：0x0014

类型：Int32
