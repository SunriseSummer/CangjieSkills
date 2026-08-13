<!-- cj-doc kind="api-member" level="6" id="stdx.fuzz.fuzz.class.fuzzdataprovider.withcangjiedata" parent="stdx.fuzz.fuzz.class.fuzzdataprovider" -->
# FuzzDataProvider.withCangjieData

[← FuzzDataProvider](index.md)

## 签名

```cangjie role=signature
public static func withCangjieData(data: Array<UInt8>): FuzzDataProvider
```

使用 Array<UInt8> 类型的数据生成 FuzzDataProvider 类型实例。

## 契约

参数：

- data: Array\<UInt8> - 输入的外部数据。

返回值：

- FuzzDataProvider - 构造的 FuzzDataProvider 类型实例。
