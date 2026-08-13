<!-- cj-doc kind="api-member" level="6" id="std.net.struct.optionname.field-so_acceptconn" parent="std.net.struct.optionname" -->
# OptionName.SO_ACCEPTCONN

[← OptionName](index.md)

## 签名

```cangjie role=signature
public static const SO_ACCEPTCONN: Int32
```

用于查询套接字是否处于监听状态的套接字选项。

## 契约

功能：用于查询套接字是否处于监听状态的套接字选项。不同系统下的值分别为：

- macOS: 0x0002
- Windows: 0x0002
- 其他情况：0x001E

类型：Int32
