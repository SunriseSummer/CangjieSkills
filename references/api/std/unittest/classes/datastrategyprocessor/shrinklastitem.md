<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.datastrategyprocessor.shrinklastitem" parent="std.unittest.class.datastrategyprocessor" -->
# DataStrategyProcessor<T>.shrinkLastItem

[← DataStrategyProcessor<T>](index.md)

## 签名

```cangjie role=signature
protected func shrinkLastItem(configuration: Configuration, engine: LazyCyclicNode): Iterable<T>
```

收缩上一个条目。

## 契约

参数：

- configuration: Configuration - 配置信息。
- engine: LazyCyclicNode - 惰性节点。

返回值：

- Iterable\<T> - 收缩后的数据迭代器。
