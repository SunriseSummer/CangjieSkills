<!-- cj-doc kind="api-member" level="5" id="std.unittest.prop_test.func.randominrange-t-option-t-option-t" parent="std.unittest.prop_test" -->
# randomInRange<T>(Option<T>, Option<T>)

[← std.unittest.prop_test](../index.md)

## 签名

```cangjie role=signature
public func randomInRange<T>(min!: Option<T> = None, max!: Option<T> = None): RandomDataStrategyRange<T> where T <: ArbitraryRange<T>
```

创建一个 RandomDataStrategyRange<T>

## 契约

参数：

- min: T - 最小值（包含）。
- max: T - 最大值（不包含）。

返回值：

- RandomDataStrategyRange\<T> - 随机数据策略器。
