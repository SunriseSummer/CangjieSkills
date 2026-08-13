<!-- cj-doc kind="api-member" level="6" id="std.net.struct.optionname.field-so_broadcast" parent="std.net.struct.optionname" -->
# OptionName.SO_BROADCAST

[← OptionName](index.md)

## 签名

```cangjie role=signature
public static const SO_BROADCAST: Int32
```

用于设置套接字是否允许发送广播消息的套接字选项。

## 契约

功能：用于设置套接字是否允许发送广播消息的套接字选项。不同系统下的值分别为：

- macOS: 0x0020
- Windows: 0x0020
- 其他情况：0x0006

类型：Int32
