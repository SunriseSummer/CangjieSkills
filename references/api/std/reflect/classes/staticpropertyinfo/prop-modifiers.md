<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.staticpropertyinfo.prop-modifiers" parent="std.reflect.class.staticpropertyinfo" -->
# StaticPropertyInfo.modifiers

[← StaticPropertyInfo](index.md)

## 签名

```cangjie role=signature
public prop modifiers: Collection<ModifierInfo>
```

获取该 StaticPropertyInfo 对应的静态成员属性所拥有的所有修饰符的信息，返回对应集合。

## 契约

> **注意：**
>
> - 如果该静态成员属性无任何修饰符，则返回空集合。
> - 该集合不保证遍历顺序恒定。
> - 目前获取到的修饰符集合内容较为混乱，尚未统一。

类型：Collection\<ModifierInfo>
