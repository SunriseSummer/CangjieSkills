<!-- cj-doc kind="api-member" level="5" id="std.core.func.ifnone-t-option-t-unit" parent="std.core" -->
# ifNone<T>(Option<T>, () -> Unit)

[← std.core](../index.md)

## 签名

```cangjie role=signature
public func ifNone<T>(o: Option<T>, action: () -> Unit): Unit
```

如果输入是 Option.None 类型数据，则执行 action 函数。

## 契约

参数：

- o: Option\<T> - 待判断是否为 Option.None 的 Option\<T> 类型实例。
- action: () ->Unit - 待执行函数。
