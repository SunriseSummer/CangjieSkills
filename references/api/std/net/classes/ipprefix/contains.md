<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipprefix.contains" parent="std.net.class.ipprefix" -->
# IPPrefix.contains

[← IPPrefix](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func contains(IPAddress)

### 签名

```cangjie role=signature
public func contains(rhs: IPAddress): Bool
```

此 IPPrefix 地址是否包含指定的 IPAddress 地址。

### 契约

参数：

- rhs: IPAddress - 指定的 IPAddress 地址。

返回值：

- Bool - 返回 true 表示包含指定的 IPAddress 地址，false 表示不包含。

## func contains(IPPrefix)

### 签名

```cangjie role=signature
public func contains(rhs: IPPrefix): Bool
```

此 IPPrefix 地址是否包含指定的 IPPrefix 地址。

### 契约

参数：

- rhs: IPPrefix - 指定的 IPPrefix 地址。

返回值：

- Bool - 返回 true 表示包含指定的 IPPrefix 地址，false 表示不包含。
