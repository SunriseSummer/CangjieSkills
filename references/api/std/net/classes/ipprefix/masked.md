<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipprefix.masked" parent="std.net.class.ipprefix" -->
# IPPrefix.masked

[← IPPrefix](index.md)

## 签名

```cangjie role=signature
public open func masked(): IPPrefix
```

返回此 IPPrefix 地址根据前缀长度进行掩码后的 IPPrefix 地址，比如 `192.168.12.34/16` 返回 `192.168.0.0/16`；`fc00::1:2:3:4/16` 返回 `fc00::/16`。

## 契约

返回值：

- IPPrefix - 此 IPPrefix 地址根据前缀长度进行掩码后的 IPPrefix 地址。
