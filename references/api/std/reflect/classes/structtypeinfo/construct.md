<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.structtypeinfo.construct" parent="std.reflect.class.structtypeinfo" -->
# StructTypeInfo.construct

[← StructTypeInfo](index.md)

## 签名

```cangjie role=signature
public func construct(args: Array<Any>): Any
```

在该 StructTypeInfo 对应的 `struct` 类型中根据实参列表搜索匹配的构造函数并调用，传入实参列表，返回调用结果。

## 契约

参数：

- args: Array\<Any> - 实参列表。

返回值：

- Any - 该 `struct` 类型的实例。

异常：

- MisMatchException - 如果 `args` 未能成功匹配任何该 `struct` 类型的 `public` 构造函数，则抛出异常
- InvocationTargetException - 在被调用的构造函数内部抛出的任何异常均将被封装为 InvocationTargetException 异常并抛出。
