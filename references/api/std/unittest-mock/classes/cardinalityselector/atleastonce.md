<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.cardinalityselector.atleastonce" parent="std.unittest.mock.class.cardinalityselector" -->
# CardinalitySelector<A>.atLeastOnce

[← CardinalitySelector<A>](index.md)

## 签名

```cangjie role=signature
func atLeastOnce(): Unit
```

定义“桩行为”最少被执行一次。

## 契约

功能：定义“桩行为”最少被执行一次。验证不到一次时，抛出异常。

异常：

- ExceptionFailedException - 验证“桩行为”执行次数不到一次时，抛出异常。
