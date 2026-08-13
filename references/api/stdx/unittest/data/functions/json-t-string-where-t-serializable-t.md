<!-- cj-doc kind="api-member" level="5" id="stdx.unittest.data.func.json-t-string-where-t-serializable-t" parent="stdx.unittest.data" -->
# json<T>(String) where T <: Serializable<T>

[← stdx.unittest.data](../index.md)

## 签名

```cangjie role=signature
public func json<T>(fileName: String): JsonStrategy<T> where T <: Serializable<T>
```

该函数可从 JSON 文件中读取类型 T 的数据值，其中 T 必须可被序列化。

## 契约

功能：该函数可从 JSON 文件中读取类型 T 的数据值，其中 T 必须可被序列化。该函数的返回值是参数化测试的一种参数源。

参数：

- fileName: String - JSON 格式的文件地址，可为相对地址。

返回值：

- JsonStrategy\<T> - T 可被序列化，数据值从 JSON 文件中读取。
