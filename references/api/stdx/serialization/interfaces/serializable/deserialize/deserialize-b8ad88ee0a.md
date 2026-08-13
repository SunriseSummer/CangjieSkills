<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.deserialize.deserialize-b8ad88ee0a" parent="stdx.serialization.serialization.interface.serializable.deserialize" -->
# Serializable.static func deserialize(DataModel)

[← Serializable.deserialize](index.md)

## 签名

```cangjie role=signature
static func deserialize(dm: DataModel): T
```

将 DataModel 反序列化为对象。

## 契约

> **说明：**
>
> 支持实现 Serializable 的类型包括：
>
> - 基本数据类型：整数类型、浮点类型、布尔类型、字符类型、字符串类型。
> - Collection 类型：Array、ArrayList、HashSet、HashMap、Option。
> - 用户自定义的实现了 Serializable\<T> 的类型。

参数：

- dm: DataModel - 待反序列化的数据。

返回值：

- T - 反序列化的对象。

异常：

- DataModelException - 当 `dm` 的类型不支持反序列化到 T 类型时，抛出异常。
