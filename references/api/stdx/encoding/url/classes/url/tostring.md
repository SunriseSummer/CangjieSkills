<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.url.class.url.tostring" parent="stdx.encoding.url.class.url" -->
# URL.toString

[← URL](index.md)

## 签名

```cangjie role=signature
public func toString(): String
```

获取当前 URL 实例的字符串值。

## 契约

会把 hostName 编码，其余部分取 rawXXX (此处泛指前缀是 raw 的 URL 属性)属性值，按照 URL 组件构成顺序进行拼接而获得该函数返回值。

返回值：

- String - 当前 URL 实例的字符串值。
