<!-- cj-doc kind="api-member" level="7" id="std.unittest.class.datastrategyprocessor.productwithunit" parent="std.unittest.class.datastrategyprocessor.extension.extend-t-datastrategyprocessor-t" -->
# DataStrategyProcessor<T>.productWithUnit

[← extend <T> DataStrategyProcessor<T>](extensions/extend-t-datastrategyprocessor-t.md)

## 签名

```cangjie role=signature
public func productWithUnit<P>(p: P): MapProcessor<(T, Unit), T> where P <: DataStrategyProcessor<Unit>
```

DataStrategyProcessor 的便捷适配器。

## 契约

参数：

- p: P -  数据策略处理器。

返回值：

- | MapProcessor\<(T, Unit),R> - 处理器。
