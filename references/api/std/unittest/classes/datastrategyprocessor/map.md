<!-- cj-doc kind="api-member" level="7" id="std.unittest.class.datastrategyprocessor.map" parent="std.unittest.class.datastrategyprocessor.extension.extend-t-datastrategyprocessor-t" -->
# DataStrategyProcessor<T>.map

[← extend <T> DataStrategyProcessor<T>](extensions/extend-t-datastrategyprocessor-t.md)

## 签名

```cangjie role=signature
public func map<R>(f: (T) -> R): MapProcessor<T, R>
```

简单地将 `f` 应用于原始数据策略的每个项目。

## 契约

功能：简单地将 `f` 应用于原始数据策略的每个项目。 Shrink 也会发生在原始输入上，然后进行映射。

参数：

- f: (T) -> R - 需要增加的处理逻辑函数。

返回值：

- MapProcessor\<T, R> - 应用 `f` 后的处理器。
