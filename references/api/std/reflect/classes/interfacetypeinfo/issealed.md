<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.interfacetypeinfo.issealed" parent="std.reflect.class.interfacetypeinfo" -->
# InterfaceTypeInfo.isSealed

[← InterfaceTypeInfo](index.md)

## 签名

```cangjie role=signature
public func isSealed(): Bool
```

判断该 InterfaceTypeInfo 所对应的 `interface` 类型是否拥有 `sealed` 语义。

## 契约

返回值：

- Bool - 如果该 `interface` 类型拥有 `sealed` 语义则返回 `true`，否则返回 `false`。
