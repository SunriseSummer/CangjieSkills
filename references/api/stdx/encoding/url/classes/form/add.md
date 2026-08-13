<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.url.class.form.add" parent="stdx.encoding.url.class.form" -->
# Form.add

[← Form](index.md)

## 签名

```cangjie role=signature
public func add(key: String, value: String): Unit
```

新增 key-value 映射，如果 key 已存在，则将 value 添加到原来 value 数组的最后面。

## 契约

参数：

- key: String - 指定键，可以是新增的。
- value: String - 将该值添加到指定键对应的值数组中。
