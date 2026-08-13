<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httpheaders.get" parent="stdx.net.http.class.httpheaders" -->
# HttpHeaders.get

[← HttpHeaders](index.md)

## 签名

```cangjie role=signature
public func get(name: String): Collection<String>
```

获取指定 name 对应的 value 值。

## 契约

参数：

- name: String - 字段名称，不区分大小写。

返回值：

- Collection\<String> - name 对应的 value 集合，如果指定 name 不存在，返回空集合。
