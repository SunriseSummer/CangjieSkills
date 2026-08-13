<!-- cj-doc kind="api-member" level="5" id="std.reflect.func.parseparametertypes-string" parent="std.reflect" -->
# parseParameterTypes(String)

[← std.reflect](../index.md)

## 签名

```cangjie role=signature
public func parseParameterTypes(parameters: String): Array<TypeInfo>
```

从字符串中解析出参数类型，并将其转换为类型数组，以便`getStaticFunction`等函数使用。

## 契约

函数参数类型限定名称为函数类型的参数类型部分，不包含参数名、默认值，也不包含最外层的 `()`。
因此对于下面的一个仓颉函数：

其限定名称应该为`"Int64, p1.T1, Int64, Int64"`。对于无参函数的限定名称应该为 `""`。

参数：

- parameters: String - 函数参数类型限定名称。

返回值：

- Array\<TypeInfo> - 字符串对应的参数类型信息。

异常：

- IllegalArgumentException - 字符串格式错误，则会抛出异常。
- InfoNotFoundException - 如果无法获得参数中的类型信息，则会抛出异常。
