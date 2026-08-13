<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.staticfunctioninfo.operator-ne" parent="std.reflect.class.staticfunctioninfo" -->
# StaticFunctionInfo.!=

[← StaticFunctionInfo](index.md)

## 签名

```cangjie role=signature
public operator func !=(that: StaticFunctionInfo): Bool
```

判断该静态成员函数信息与给定的另一个静态成员函数信息是否不等。

## 契约

参数：

- that: StaticFunctionInfo - 被比较相等性的另一个静态成员函数信息。

返回值：

- Bool - 如果该静态成员函数信息与 `that` 不等则返回 `true`，否则返回 `false`。
