<!-- cj-doc kind="api-member" level="6" id="stdx.serialization.serialization.class.datamodelstruct.get" parent="stdx.serialization.serialization.class.datamodelstruct" -->
# DataModelStruct.get

[← DataModelStruct](index.md)

## 签名

```cangjie role=signature
public func get(key: String): DataModel
```

获取 `key` 对应的数据。

## 契约

参数：

- key: String - 传入的 String 类型。

返回值：

- DataModel - 类型为 DataModel，如未查找到对应值，则返回 DataModelNull。
