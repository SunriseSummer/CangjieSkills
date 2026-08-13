<!-- cj-doc kind="api-member" level="5" id="std.core.func.ifsome-t-option-t-t-unit" parent="std.core" -->
# ifSome<T>(Option<T>, (T) -> Unit)

[← std.core](../index.md)

## 签名

```cangjie role=signature
public func ifSome<T>(o: Option<T>, action: (T) -> Unit): Unit
```

如果输入是 Option.Some 类型数据，则执行 action 函数。

## 契约

参数：

- o: Option\<T> - 待判断是否为 Option.Some 的 Option\<T> 类型实例，同时其封装的 `T` 类型实例将作为 action 函数的输入。
- action: (T) ->Unit - 待执行函数。
