<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httpheaders.add" parent="stdx.net.http.class.httpheaders" -->
# HttpHeaders.add

[← HttpHeaders](index.md)

## 签名

```cangjie role=signature
public func add(name: String, value: String): Unit
```

添加指定键值对。

## 契约

功能：添加指定键值对。如果 name 已经存在，将在其对应的值列表中添加 value；如果 name 不存在，则添加 name 字段及其值 value。

参数：

- name: String - HttpHeaders 的字段名称。
- value: String - HttpHeaders 的字段值。

异常：

- HttpException - 如果传入的 name/value 包含不合法元素，将抛出此异常。
