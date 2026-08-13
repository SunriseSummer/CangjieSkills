<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.cardinalityselector.atleasttimes" parent="std.unittest.mock.class.cardinalityselector" -->
# CardinalitySelector<A>.atLeastTimes

[← CardinalitySelector<A>](index.md)

## 签名

```cangjie role=signature
func atLeastTimes(minTimesExpected: Int64): Unit
```

定义“桩行为”最少被执行指定次数的行为。

## 契约

功能：定义“桩行为”最少被执行指定次数的行为。验证实际执行次数低于最少指定次数时，抛出异常。

参数：

- minTimesExpected: Int64 - 预期“桩行为”最少被执行的次数。

异常：

- ExceptionFailedException - 验证“桩行为”执行少于指定次数时，抛出异常。
- IllegalArgumentException - 当作为`minTimesExpected`参数传递的数字为负数时，抛出异常。
