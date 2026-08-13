<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.packageinfo.operator-eq" parent="std.reflect.class.packageinfo" -->
# PackageInfo.==

[← PackageInfo](index.md)

## 签名

```cangjie role=signature
public operator func ==(that: PackageInfo): Bool
```

判断该包信息与给定的另一个包信息是否相等。

## 契约

> **注意：**
>
> 内部实现为比较两个包信息的限定名称是否相等。

参数：

- that: PackageInfo - 被比较相等性的另一个包信息。

返回值：

- Bool - 如果该包信息与 `that` 相等则返回 `true`，否则返回 `false`。
