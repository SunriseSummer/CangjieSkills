<!-- cj-doc kind="api-member" level="6" id="stdx.unittest.data.class.csvstrategy.provider" parent="stdx.unittest.data.class.csvstrategy" -->
# CsvStrategy.provider

[← CsvStrategy](index.md)

## 签名

```cangjie role=signature
public override func provider(configuration: Configuration): SerializableProvider<T>
```

生成序列化数据迭代器。

## 契约

参数：

- configuration: Configuration - 数据配置信息。

返回值：

- SerializableProvider\<T> - 序列化迭代器对象。
