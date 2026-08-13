<!-- cj-doc kind="api-member" level="6" id="std.net.struct.optionname.field-so_reuseaddr" parent="std.net.struct.optionname" -->
# OptionName.SO_REUSEADDR

[← OptionName](index.md)

## 签名

```cangjie role=signature
public static const SO_REUSEADDR: Int32
```

用于在套接字关闭后立即释放其绑定端口，以便其他套接字可以立即绑定该端口的套接字选项。

## 契约

功能：用于在套接字关闭后立即释放其绑定端口，以便其他套接字可以立即绑定该端口的套接字选项。不同系统下的值分别为：

- macOS: 0x0004
- Windows: 0x0004
- 其他情况：0x0002

类型：Int32
