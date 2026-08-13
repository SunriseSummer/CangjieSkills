<!-- cj-doc kind="api-member" level="6" id="stdx.fuzz.fuzz.class.fuzzdataprovider.consumeint16" parent="stdx.fuzz.fuzz.class.fuzzdataprovider" -->
# FuzzDataProvider.consumeInt16

[← FuzzDataProvider](index.md)

## 签名

```cangjie role=signature
public open func consumeInt16(): Int16
```

将数据转换成 Int16 类型实例。

## 契约

返回值：

- Int16 - Int16 类型实例。

异常：

- IllegalArgumentException - 如果 count 为负数，则抛出异常。
