<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.cardinalityselector.once" parent="std.unittest.mock.class.cardinalityselector" -->
# CardinalitySelector<A>.once

[← CardinalitySelector<A>](index.md)

## 签名

```cangjie role=signature
func once(): Continuation<A>
```

定义“桩行为”仅被执行一次。

## 契约

功能：定义“桩行为”仅被执行一次。此函数将在验证桩签名执行次数超出一次时，抛出异常。

返回值：

- Continuation\<A> - 对象实例可调用方法继续生成 ActionSelector 对象。

异常：

- ExceptionFailedException - 验证“桩行为”执行次数超过一次时，立即抛出异常。
