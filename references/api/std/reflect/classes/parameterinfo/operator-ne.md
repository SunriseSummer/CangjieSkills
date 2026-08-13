<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.parameterinfo.operator-ne" parent="std.reflect.class.parameterinfo" -->
# ParameterInfo.!=

[← ParameterInfo](index.md)

## 签名

```cangjie role=signature
public operator func !=(that: ParameterInfo): Bool
```

判断该函数形参信息与给定的另一个函数形参信息是否不等。

## 契约

参数：

- that: ParameterInfo - 被比较相等性的另一个函数形参信息。

返回值：

- Bool - 如果该函数形参信息与 `that` 不等则返回 `true`，否则返回 `false`。
