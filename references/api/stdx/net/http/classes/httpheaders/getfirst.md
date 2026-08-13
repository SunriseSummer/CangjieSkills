<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httpheaders.getfirst" parent="stdx.net.http.class.httpheaders" -->
# HttpHeaders.getFirst

[← HttpHeaders](index.md)

## 签名

```cangjie role=signature
public func getFirst(name: String): ?String
```

获取指定 name 对应的第一个 value 值。

## 契约

参数：

- name: String - 字段名称，不区分大小写。

返回值：

- ?String - name 对应的第一个 value 值，如果指定 name 不存在，返回 None。
