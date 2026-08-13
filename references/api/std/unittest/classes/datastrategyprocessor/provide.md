<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.datastrategyprocessor.provide" parent="std.unittest.class.datastrategyprocessor" -->
# DataStrategyProcessor<T>.provide

[← DataStrategyProcessor<T>](index.md)

## 签名

```cangjie role=signature
protected func provide(configuration: Configuration): Iterable<T>
```

生成依据配置信息和数据策略生成的数据迭代器。

## 契约

参数：

- configuration: Configuration - 处理策略配置信息。

返回值：

- Iterable\<T> - 数据迭代器。
