<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.cardinalityselector.times" parent="std.unittest.mock.class.cardinalityselector" -->
# CardinalitySelector<A>.times

[← CardinalitySelector<A>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func times(Int64)

### 签名

```cangjie role=signature
func times(expectedTimes: Int64): Continuation<A>
```

定义“桩行为”被执行指定次数。

### 契约

功能：定义“桩行为”被执行指定次数。验证不是指定次数时，抛出异常。

参数：

- expectedTimes: Int64 - 预期“桩行为”被执行的次数。

返回值：

- Continuation\<A> - 对象实例可调用方法继续生成 ActionSelector 对象。

异常：

- ExceptionFailedException - 验证“桩行为”执行次数不是指定次数时，抛出异常。
- IllegalArgumentException - 当作为`expectedTimes`参数传递的数字为负数时，抛出异常。

## func times(Int64, Int64)

### 签名

```cangjie role=signature
func times(min!: Int64, max!: Int64): Unit
```

定义“桩行为”执行指定次数范围。

### 契约

功能：定义“桩行为”执行指定次数范围。验证超出指定次数范围时，抛出异常。

参数：

- min!: Int64 - 预期“桩行为”被执行的最小次数。
- max!: Int64 - 预期“桩行为”被执行的最大次数。

异常：

- ExceptionFailedException - 验证“桩行为”执行次数不是指定次数范围时，抛出异常。
- IllegalArgumentException - 当传入的`min`或`max`参数为负数时，抛出异常。
