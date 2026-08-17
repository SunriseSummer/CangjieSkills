<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.enumtypeinfo.getconstructor" parent="std.reflect.class.enumtypeinfo" -->
# EnumTypeInfo.getConstructor

[← EnumTypeInfo](index.md)

## 签名

```cangjie role=signature
public func getConstructor(constructor: String, argsCount!: Int64 = 0): EnumConstructorInfo
```

按构造子名与参数个数查询构造子信息。

## 注意
>
不支持平台：macOS、iOS、OpenHarmony、HarmonyOS。

## 参数

- constructor: String - 构造子名（不含参数签名），例如 `M2`。
- argsCount!: Int64 - 参数个数；为 `0` 时不限制参数个数。

## 返回值

- EnumConstructorInfo - 匹配到的构造子信息。

## 异常

- InfoNotFoundException - 如果未找到匹配的构造子，则抛出异常。

