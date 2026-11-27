<!-- cj-doc kind="api-member" level="5" id="std.env.func.removevariable-string" parent="std.env" -->
# removeVariable(String)

[← std.env](../index.md)

## 签名

```cangjie role=signature
public func removeVariable(key: String): Unit
```

通过指定环境变量名称移除环境变量。

## 契约

参数：

- key: String - 环境变量名称。

异常：

- IllegalArgumentException - 当函数参数 key 包含空字符时，抛出异常。
