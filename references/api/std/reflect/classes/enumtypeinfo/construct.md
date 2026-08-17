<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.enumtypeinfo.construct" parent="std.reflect.class.enumtypeinfo" -->
# EnumTypeInfo.construct

[← EnumTypeInfo](index.md)

## 签名

```cangjie role=signature
public func construct(constructor: String, args: Array<Any>): Any
```

根据构造子签名和实参列表构造该枚举的实例并返回。

## 注意
>
不支持平台：macOS、iOS、OpenHarmony、HarmonyOS。

## 参数

- constructor: String - 构造子签名。
- args: Array<Any> - 构造子实参列表。

## 返回值

- Any - 构造出的枚举实例。

## 异常

- InvocationTargetException - 如果 `args` 的数量或类型与构造子参数不匹配或者指定的构造子不存在，则抛出异常。

