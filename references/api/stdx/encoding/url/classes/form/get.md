<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.url.class.form.get" parent="stdx.encoding.url.class.form" -->
# Form.get

[← Form](index.md)

## 签名

```cangjie role=signature
public func get(key: String): Option<String>
```

根据 key 获取第一个对应的 value 值。

## 契约

举例：

- 当 query 组件部分是 `a=b` 时，`form.get("a")`获得 `Some(b)`。
- 当 query 组件部分是 `a=` 时，`form.get("a")`获得 `Some()`。
- 当 query 组件部分是 `a` 时，`form.get("a")`获得 `Some()`。
- 当 query 组件部分是 `a` 时，`form.get("c")`获得 `None`。

参数：

- key: String - 指定键。

返回值：

- Option\<String> - 根据指定键获取的第一个值，用 Option\<String> 类型表示。
