<!-- cj-doc kind="api-member" level="6" id="std.net.struct.optionname.field-so_error" parent="std.net.struct.optionname" -->
# OptionName.SO_ERROR

[← OptionName](index.md)

## 签名

```cangjie role=signature
public static const SO_ERROR: Int32
```

获取和清除套接字上错误状态的套接字选项。

## 契约

功能：获取和清除套接字上错误状态的套接字选项。不同系统下的值分别为：

- macOS: 0x1007
- Windows: 0x1007
- 其他情况：0x0004

类型：Int32
