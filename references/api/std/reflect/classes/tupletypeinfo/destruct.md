<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.tupletypeinfo.destruct" parent="std.reflect.class.tupletypeinfo" -->
# TupleTypeInfo.destruct

[← TupleTypeInfo](index.md)

## 签名

```cangjie role=signature
public func destruct(instance: Any): ReadOnlyList<Any>
```

将指定元组实例拆解为各元素的只读列表并返回。

## 注意
>
不支持平台：macOS、iOS、OpenHarmony、HarmonyOS。

## 参数

- instance: Any - 该 TupleTypeInfo 对应类型的实例。

## 返回值

- ReadOnlyList<Any> - 元组实例中的元素值列表，顺序与元组声明一致。

## 异常

- IllegalTypeException - 如果 `instance` 的运行时类型与该 TupleTypeInfo 不一致，则抛出异常。

