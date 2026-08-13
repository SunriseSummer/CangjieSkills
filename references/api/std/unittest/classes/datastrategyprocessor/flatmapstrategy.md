<!-- cj-doc kind="api-member" level="7" id="std.unittest.class.datastrategyprocessor.flatmapstrategy" parent="std.unittest.class.datastrategyprocessor.extension.extend-t-datastrategyprocessor-t" -->
# DataStrategyProcessor<T>.flatMapStrategy

[← extend <T> DataStrategyProcessor<T>](extensions/extend-t-datastrategyprocessor-t.md)

## 签名

```cangjie role=signature
public func flatMapStrategy<R>(f: (T) -> DataStrategy<R>): FlatMapStrategyProcessor<T, R>
```

简单地将 `f` 应用于原始数据策略的每个项目，然后展平结果。

## 契约

功能：简单地将 `f` 应用于原始数据策略的每个项目，然后展平结果。 Shrink 是通过返回的策略而不是原始输入来完成的。

参数：

- f: (T) -> DataStrategy\<R> - 需要增加的处理逻辑函数。

返回值：

- FlatMapStrategyProcessor\<T, R> - 应用 `f` 后的处理器。
