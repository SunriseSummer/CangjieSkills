<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.methodactionselector.returns" parent="std.unittest.mock.class.methodactionselector" -->
# MethodActionSelector<TRet>.returns

[← MethodActionSelector<TRet>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func returns(() -> TRet)

### 签名

```cangjie role=signature
func returns(valueFactory: () -> TRet): CardinalitySelector<MethodActionSelector<TRet>>
```

定义桩签名返回指定的值的行为，该值由传入的闭包生成。

### 契约

参数：

- valueFactory: () -> TRet - 生成预期返回值的闭包函数（生成器）。

返回值：

- CardinalitySelector\<MethodActionSelector\<TRet>> - 定义了桩签名返回指定值的行为的 CardinalitySelector\<TRet> 对象实例。

## func returns(TRet)

### 签名

```cangjie role=signature
func returns(value: TRet): CardinalitySelector<MethodActionSelector<TRet>>
```

定义桩签名返回指定值的行为。

### 契约

参数：

- value: TRet - 预期桩签名的返回值。

返回值：

- CardinalitySelector\<MethodActionSelector\<TRet>> - 定义了桩签名返回行为的 CardinalitySelector\<TRet> 对象实例。
