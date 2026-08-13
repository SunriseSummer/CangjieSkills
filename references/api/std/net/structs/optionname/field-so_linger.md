<!-- cj-doc kind="api-member" level="6" id="std.net.struct.optionname.field-so_linger" parent="std.net.struct.optionname" -->
# OptionName.SO_LINGER

[← OptionName](index.md)

## 签名

```cangjie role=signature
public static const SO_LINGER: Int32
```

用于设置套接字关闭时行为的套接字选项。

## 契约

功能：用于设置套接字关闭时行为的套接字选项。不同系统下的值分别为：

- macOS: 0x0080
- Windows: 0x0080
- 其他情况：0x000D

类型：Int32
