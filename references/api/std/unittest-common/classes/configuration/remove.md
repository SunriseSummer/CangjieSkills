<!-- cj-doc kind="api-member" level="6" id="std.unittest.common.class.configuration.remove" parent="std.unittest.common.class.configuration" -->
# Configuration.remove

[← Configuration](index.md)

## 签名

```cangjie role=signature
public func remove<T>(key: KeyFor<T>): ?T
```

删除对应键名称和类型的值。

## 契约

参数：

- key: KeyFor - 配置项的键值。

返回值：

- ?T - 当存在该值时返回该值，当不存在时返回 None。
