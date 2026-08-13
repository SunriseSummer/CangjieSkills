<!-- cj-doc kind="api-member" level="6" id="std.unittest.common.class.configuration.getbyname" parent="std.unittest.common.class.configuration" -->
# Configuration.getByName

[← Configuration](index.md)

## 签名

```cangjie role=signature
public func getByName<T>(name: String): ?T
```

获取 key 对应的值。

## 契约

T 为 泛型参数，用于在对象中查找对应类型的值。

参数：

- name: String - 键名称。

返回值：

- ?T - 未找到时返回 None，找到对应类型及名称的值时返回 Some\<T>(v) 。
