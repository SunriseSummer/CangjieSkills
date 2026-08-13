<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.staticfunctioninfo.prop-modifiers" parent="std.reflect.class.staticfunctioninfo" -->
# StaticFunctionInfo.modifiers

[← StaticFunctionInfo](index.md)

## 签名

```cangjie role=signature
public prop modifiers: Collection<ModifierInfo>
```

获取该 StaticFunctionInfo 对应的静态成员函数所拥有的所有修饰符的信息，返回对应集合。

## 契约

> **注意：**
>
> - 如果该静态成员函数无任何修饰符，则返回空集合。
> - 该集合不保证遍历顺序恒定。
> - 即便未被某修饰符修饰，如果拥有该修饰符的语义，该修饰符信息也将被包括在该集合中。

类型：Collection\<ModifierInfo>
