<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.typeinfo.operator-eq" parent="std.reflect.class.typeinfo" -->
# TypeInfo.==

[← TypeInfo](index.md)

## 签名

```cangjie role=signature
public operator func ==(that: TypeInfo): Bool
```

判断该类型信息与给定的另一个类型信息是否相等。

## 契约

参数：

- that: TypeInfo - 被比较相等性的另一个类型信息。

返回值：

- Bool - 如果该类型信息的限定名称与 `that` 相等则返回 `true`，否则返回 `false`。
