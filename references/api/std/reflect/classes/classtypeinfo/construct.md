<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.classtypeinfo.construct" parent="std.reflect.class.classtypeinfo" -->
# ClassTypeInfo.construct

[← ClassTypeInfo](index.md)

## 签名

```cangjie role=signature
public func construct(args: Array<Any>): Any
```

在该 ClassTypeInfo 对应的 `class` 类型中根据实参列表搜索匹配的构造函数并调用，传入实参列表，返回调用结果。

## 契约

参数：

- args: Array\<Any> - 实参列表。

返回值：

- Any - 该 `class` 类型的实例。

异常：

- IllegalTypeException - 如果该 `class` 类型拥有 `abstract` 语义，调用 `construct` 则抛出异常，因为抽象类不可被实例化。
- MisMatchException - 如果 `args` 未能成功匹配任何该 `class` 类型的可见性为 `public` 的构造函数，则抛出异常。
- InvocationTargetException - 在被调用的构造函数内部抛出的任何异常均将被封装为 InvocationTargetException 异常并抛出。
