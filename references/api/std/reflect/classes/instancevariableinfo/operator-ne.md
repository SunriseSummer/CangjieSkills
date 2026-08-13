<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.instancevariableinfo.operator-ne" parent="std.reflect.class.instancevariableinfo" -->
# InstanceVariableInfo.!=

[← InstanceVariableInfo](index.md)

## 签名

```cangjie role=signature
public operator func !=(that: InstanceVariableInfo): Bool
```

判断该实例成员变量信息与给定的另一个实例成员变量信息是否不等。

## 契约

参数：

- that: InstanceVariableInfo - 被比较相等性的另一个实例成员变量信息。

返回值：

- Bool - 如果该实例成员变量信息与 `that` 不等则返回 `true`，否则返回 `false`。
