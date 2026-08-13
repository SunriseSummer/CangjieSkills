<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.class.jsonwriter.jsonvalue" parent="stdx.encoding.json.stream.class.jsonwriter" -->
# JsonWriter.jsonValue

[← JsonWriter](index.md)

## 签名

```cangjie role=signature
public func jsonValue(value: String): JsonWriter
```

将符合 JSON value 规范的原始字符串写入 stream。

## 契约

> **注意：**
>
> 此函数不会对值 value 进行转义，也不会为入参添加双引号。如果使用者能够保证输入的值 value 符合数据转换标准ECMA-404 The JSON Data Interchange Standard， 建议使用该函数。

返回值：

- JsonWriter - 为方便链式调用，返回值为当前 JsonWriter 的引用。

异常：

- IllegalStateException - 当前 writer 的状态不应该写入 value 时。
