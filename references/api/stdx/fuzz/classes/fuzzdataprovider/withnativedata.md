<!-- cj-doc kind="api-member" level="6" id="stdx.fuzz.fuzz.class.fuzzdataprovider.withnativedata" parent="stdx.fuzz.fuzz.class.fuzzdataprovider" -->
# FuzzDataProvider.withNativeData

[← FuzzDataProvider](index.md)

## 签名

```cangjie role=signature
public static unsafe func withNativeData(data: CPointer<UInt8>, length: Int64): FuzzDataProvider
```

使用 C 指针数据生成 FuzzDataProvider 类型实例。

## 契约

参数：

- data: CPointer\<UInt8> - 输入的外部数据。
- length: Int64 - 数据长度。

返回值：

- FuzzDataProvider - 构造的 FuzzDataProvider 类型实例。
