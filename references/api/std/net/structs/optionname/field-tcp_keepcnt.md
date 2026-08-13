<!-- cj-doc kind="api-member" level="6" id="std.net.struct.optionname.field-tcp_keepcnt" parent="std.net.struct.optionname" -->
# OptionName.TCP_KEEPCNT

[← OptionName](index.md)

## 签名

```cangjie role=signature
public static const TCP_KEEPCNT: Int32
```

用于控制 TCP 连接中发送保持存活探测报文次数的套接字选项。

## 契约

功能：用于控制 TCP 连接中发送保持存活探测报文次数的套接字选项。不同系统下的值分别为：

- macOS: 0x0102
- Windows: 0x0010
- 其他情况：0x0006

类型：Int32
