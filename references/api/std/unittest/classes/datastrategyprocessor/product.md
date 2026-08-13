<!-- cj-doc kind="api-member" level="7" id="std.unittest.class.datastrategyprocessor.product" parent="std.unittest.class.datastrategyprocessor.extension.extend-t-datastrategyprocessor-t" -->
# DataStrategyProcessor<T>.product

[← extend <T> DataStrategyProcessor<T>](extensions/extend-t-datastrategyprocessor-t.md)

## 签名

```cangjie role=signature
public func product<R>(p: DataStrategyProcessor<R>): CartesianProductProcessor<T, R>
```

笛卡尔积组合器创建包含原始策略中元素的所有可能排列的数据策略。

## 契约

功能：笛卡尔积组合器创建包含原始策略中元素的所有可能排列的数据策略。
对于无限策略，它首先迭代所有有限的子策略，然后才推进无限的子策略。
Shrink  独立且统一地发生在原始策略的每个元素上。

参数：

- p: DataStrategyProcessor\<R> - 数据策略处理器。

返回值：

- CartesianProductProcessor\<T, R> - 笛卡尔积处理器。
