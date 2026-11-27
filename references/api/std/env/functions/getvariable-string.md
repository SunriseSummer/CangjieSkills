<!-- cj-doc kind="api-member" level="5" id="std.env.func.getvariable-string" parent="std.env" -->
# getVariable(String)

[← std.env](../index.md)

## 签名

```cangjie role=signature
public func getVariable(key: String): ?String
```

获取当前进程指定名称的环境变量值。

## 契约

参数：

- key: String - 指定名称。

返回值：

- ?String - 当前进程指定名称的环境变量值。

异常：

- IllegalArgumentException - 当函数参数 key 包含空字符时，抛出异常。
