<!-- cj-doc kind="api-member" level="6" id="stdx.fuzz.fuzz.class.debugdataprovider.consumeint64s" parent="stdx.fuzz.fuzz.class.debugdataprovider" -->
# DebugDataProvider.consumeInt64s

[← DebugDataProvider](index.md)

## 签名

```cangjie role=signature
public override func consumeInt64s(count: Int64): Array<Int64>
```

将指定数量的数据转换成 Int64 类型数组。

## 契约

参数：

- count: Int64 - 指定转换的数据量。

返回值：

- Array\<Int64> - Int64 类型数组。

异常：

- IllegalArgumentException - 如果 count 为负数，则抛出异常。
