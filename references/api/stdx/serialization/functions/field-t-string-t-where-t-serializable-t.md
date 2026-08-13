<!-- cj-doc kind="api-member" level="5" id="stdx.serialization.serialization.func.field-t-string-t-where-t-serializable-t" parent="stdx.serialization.serialization" -->
# field<T>(String, T) where T <: Serializable<T>

[← stdx.serialization.serialization](../index.md)

## 签名

```cangjie role=signature
public func field<T>(name: String, data: T) : Field where T <: Serializable<T>
```

此函数用于将一组数据 `name` 和 `data` 封装到 Field 对象中。

## 契约

功能：此函数用于将一组数据 `name` 和 `data` 封装到 Field 对象中。处理一组数据 `name` 和 `data`，将 `data` 序列化为 DataModel 类型，并将二者封装到 Field 对象中。

参数：

- name: String - String 类型，`name` 字段为 `""` 时行为与为其它字符串时一致。
- data: T - `T` 类型，`T` 类型必须实现 Serializable\<T> 接口。

返回值：

- Field - 封装了 `name` 和 `data` 的 Field 对象。
