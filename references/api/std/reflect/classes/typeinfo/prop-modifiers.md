<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.typeinfo.prop-modifiers" parent="std.reflect.class.typeinfo" -->
# TypeInfo.modifiers

[← TypeInfo](index.md)

## 签名

```cangjie role=signature
public prop modifiers: Collection<ModifierInfo>
```

获取该 TypeInfo 对应的类型拥有的所有修饰符的信息，返回对应集合。

## 契约

> **注意：**
>
> - 如果该类型无任何修饰符，则返回空集合。
> - 该集合不保证遍历顺序恒定。
> - `interface` 类型默认拥有 `open` 语义，故返回的集合总是包含 `open` 修饰符。
> - 由于反射功能只能对所有被 `public` 访问控制修饰符所修饰的类型进行操作，故将忽略所有访问控制修饰符。

类型：Collection\<ModifierInfo>
