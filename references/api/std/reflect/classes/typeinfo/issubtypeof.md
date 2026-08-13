<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.typeinfo.issubtypeof" parent="std.reflect.class.typeinfo" -->
# TypeInfo.isSubtypeOf

[← TypeInfo](index.md)

## 签名

```cangjie role=signature
public func isSubtypeOf(supertype: TypeInfo): Bool
```

判断当前 TypeInfo 实例对应的类型是否是参数中指定的 TypeInfo 实例表示的类型的子类型。

## 契约

参数：

- supertype: TypeInfo - 目标类型的类型信息。

返回值：

- Bool - 如果该 TypeInfo 对应的类型是 `supertype` 所对应的类型的子类型则返回 `true`，否则返回 `false`。
