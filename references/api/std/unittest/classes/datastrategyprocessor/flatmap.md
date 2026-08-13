<!-- cj-doc kind="api-member" level="7" id="std.unittest.class.datastrategyprocessor.flatmap" parent="std.unittest.class.datastrategyprocessor.extension.extend-t-datastrategyprocessor-t" -->
# DataStrategyProcessor<T>.flatMap

[← extend <T> DataStrategyProcessor<T>](extensions/extend-t-datastrategyprocessor-t.md)

## 签名

```cangjie role=signature
public func flatMap<R>(f: (T) -> DataProvider<R>): FlatMapProcessor<T, R>
```

简单地将 `f` 应用于原始数据策略的每个项目，然后展平结果。

## 契约

功能：简单地将 `f` 应用于原始数据策略的每个项目，然后展平结果。 Shrink  也会发生在原始输入上，然后进行 flatMap 。

参数：

- f: (T) -> DataProvider\<R> - 需要增加的处理逻辑函数。

返回值：

- FlatMapProcessor\<T, R> - 应用 `f` 后的处理器。
