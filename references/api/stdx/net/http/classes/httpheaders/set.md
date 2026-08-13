<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httpheaders.set" parent="stdx.net.http.class.httpheaders" -->
# HttpHeaders.set

[← HttpHeaders](index.md)

## 签名

```cangjie role=signature
public func set(name: String, value: String): Unit
```

设置指定键值对。

## 契约

功能：设置指定键值对。如果 name 已经存在，传入的 value 将会覆盖之前的值。

参数：

- name: String - HttpHeaders 的字段名称。
- value: String - HttpHeaders 的字段值。

异常：

- HttpException - 如果传入的 name/values 包含不合法元素，将抛出此异常。
