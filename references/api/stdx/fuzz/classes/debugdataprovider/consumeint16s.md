<!-- cj-doc kind="api-member" level="6" id="stdx.fuzz.fuzz.class.debugdataprovider.consumeint16s" parent="stdx.fuzz.fuzz.class.debugdataprovider" -->
# DebugDataProvider.consumeInt16s

[← DebugDataProvider](index.md)

## 签名

```cangjie role=signature
public override func consumeInt16s(count: Int64): Array<Int16>
```

将指定数量的数据转换成 Int16 类型数组。

## 契约

参数：

- count: Int64 - 指定转换的数据量。

返回值：

- Array\<Int16> - Int16 类型数组。

异常：

- IllegalArgumentException - 如果 count 为负数，则抛出异常。
