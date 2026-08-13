<!-- cj-doc kind="api-member" level="6" id="std.net.struct.optionname.field-so_keepalive" parent="std.net.struct.optionname" -->
# OptionName.SO_KEEPALIVE

[← OptionName](index.md)

## 签名

```cangjie role=signature
public static const SO_KEEPALIVE: Int32
```

用于检测 `TCP` 连接是否仍然处于活动状态的套接字选项。

## 契约

功能：用于检测 `TCP` 连接是否仍然处于活动状态的套接字选项。不同系统下的值分别为：

- macOS: 0x0008
- Windows: 0x0008
- 其他情况：0x0009

类型：Int32
