<!-- cj-doc kind="api-member" level="6" id="stdx.fuzz.fuzz.class.fuzzdataprovider.consumeuint8s" parent="stdx.fuzz.fuzz.class.fuzzdataprovider" -->
# FuzzDataProvider.consumeUInt8s

[← FuzzDataProvider](index.md)

## 签名

```cangjie role=signature
public open func consumeUInt8s(count: Int64): Array<UInt8>
```

将指定数量的数据转换成 UInt8 类型数组。

## 契约

参数：

- count: Int64 - 指定转换的数据量。

返回值：

- Array\<UInt8> - UInt8 类型数组。

异常：

- IllegalArgumentException - 如果 count 为负数，则抛出异常。
