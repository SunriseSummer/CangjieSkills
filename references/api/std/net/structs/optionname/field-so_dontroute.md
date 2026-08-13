<!-- cj-doc kind="api-member" level="6" id="std.net.struct.optionname.field-so_dontroute" parent="std.net.struct.optionname" -->
# OptionName.SO_DONTROUTE

[← OptionName](index.md)

## 签名

```cangjie role=signature
public static const SO_DONTROUTE: Int32
```

用于在连接套接字时，不路由套接字数据包的套接字选项。

## 契约

功能：用于在连接套接字时，不路由套接字数据包的套接字选项。不同系统下的值分别为：

- macOS: 0x0010
- Windows: 0x0010
- 其他情况：0x0005

类型：Int32
