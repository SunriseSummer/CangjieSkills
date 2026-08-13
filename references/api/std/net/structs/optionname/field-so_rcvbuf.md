<!-- cj-doc kind="api-member" level="6" id="std.net.struct.optionname.field-so_rcvbuf" parent="std.net.struct.optionname" -->
# OptionName.SO_RCVBUF

[← OptionName](index.md)

## 签名

```cangjie role=signature
public static const SO_RCVBUF: Int32
```

用于设置套接字接收缓冲区大小的套接字选项。

## 契约

功能：用于设置套接字接收缓冲区大小的套接字选项。不同系统下的值分别为：

- macOS: 0x1002
- Windows: 0x1002
- 其他情况：0x0008

类型：Int32
