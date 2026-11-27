<!-- cj-doc kind="api-member" level="5" id="std.env.func.setvariable-string-string" parent="std.env" -->
# setVariable(String, String)

[← std.env](../index.md)

## 签名

```cangjie role=signature
public func setVariable(key: String, value: String): Unit
```

用于设置一对环境变量。

## 契约

功能：用于设置一对环境变量。如果设置了同名环境变量，原始环境变量值将被覆盖。

> **说明：**
>
> Windows 下如果传入的参数 v 是空字符串，那么会从环境中移除变量 k。

参数：

- key: String - 环境变量名称。
- value: String - 环境变量值。

异常：

- IllegalArgumentException - 当函数参数 key 或 value 中包含空字符时，抛出异常。
