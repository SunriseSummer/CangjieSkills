<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.url.class.form.getall" parent="stdx.encoding.url.class.form" -->
# Form.getAll

[← Form](index.md)

## 签名

```cangjie role=signature
public func getAll(key: String): ArrayList<String>
```

根据指定的键（key）获取该键（key）对应的所有 value 值。

## 契约

参数：

- key: String - 用户指定的键（key），用于获取对应的 value 值。

返回值：

- ArrayList\<String> - 根据指定键（key）获取的全部 value 值对应的数组。当指定键（key）不存在时，返回空数组。
