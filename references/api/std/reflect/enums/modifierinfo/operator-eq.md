<!-- cj-doc kind="api-member" level="6" id="std.reflect.enum.modifierinfo.operator-eq" parent="std.reflect.enum.modifierinfo" -->
# ModifierInfo.==

[← ModifierInfo](index.md)

## 签名

```cangjie role=signature
public override operator func ==(that: ModifierInfo): Bool
```

判断该修饰符信息与给定的另一个修饰符信息是否相等。

## 契约

参数：

- that: ModifierInfo - 被比较相等性的另一个修饰符信息。

返回值：

- Bool - 如果该修饰符信息与 `that` 相等则返回 `true`，否则返回 `false`。

> **注意：**
>
> 修饰符信息的相等性的语义等价于 `enum` 类型实例的相等性的语义。
