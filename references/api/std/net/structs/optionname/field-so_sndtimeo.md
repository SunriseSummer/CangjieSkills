<!-- cj-doc kind="api-member" level="6" id="std.net.struct.optionname.field-so_sndtimeo" parent="std.net.struct.optionname" -->
# OptionName.SO_SNDTIMEO

[← OptionName](index.md)

## 签名

```cangjie role=signature
public static const SO_SNDTIMEO: Int32
```

用于设置套接字发送数据超时时间的套接字选项。

## 契约

功能：用于设置套接字发送数据超时时间的套接字选项。不同系统下的值分别为：

- macOS: 0x1005
- Windows: 0x1005
- 其他情况：0x0015

类型：Int32
