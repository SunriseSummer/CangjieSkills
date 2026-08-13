<!-- cj-doc kind="api-member" level="6" id="std.net.struct.optionname.field-so_oobinline" parent="std.net.struct.optionname" -->
# OptionName.SO_OOBINLINE

[← OptionName](index.md)

## 签名

```cangjie role=signature
public static const SO_OOBINLINE: Int32
```

用于控制接收带外数据方式的套接字选项。

## 契约

功能：用于控制接收带外数据方式的套接字选项。不同系统下的值分别为：

- macOS: 0x0100
- Windows: 0x0100
- 其他情况：0x000A

类型：Int32
