<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.generictypeinfo.operator-eq" parent="std.reflect.class.generictypeinfo" -->
# GenericTypeInfo.==

[← GenericTypeInfo](index.md)

## 签名

```cangjie role=signature
public operator func ==(that: GenericTypeInfo): Bool
```

判断该泛型类型信息与给定的另一个泛型类型信息是否相等。

## 契约

参数：

- that: GenericTypeInfo - 被比较相等性的另一个泛型类型信息。

返回值：

- Bool - 如果该泛型类型信息与 `that` 相等则返回 `true`，否则返回 `false`。
