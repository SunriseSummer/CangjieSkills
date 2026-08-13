<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.methodactionselector.returnsconsecutively" parent="std.unittest.mock.class.methodactionselector" -->
# MethodActionSelector<TRet>.returnsConsecutively

[← MethodActionSelector<TRet>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func returnsConsecutively(Array<TRet>)

### 签名

```cangjie role=signature
func returnsConsecutively(values: Array<TRet>): Continuation<MethodActionSelector<TRet>>
```

定义桩签名按列表顺序返回指定的值的行为。

### 契约

功能：定义桩签名按列表顺序返回指定的值的行为。桩签名将被调用多次，次数与数组内值的个数相同。

参数：

- values: Array\<TRet> - 桩签名的返回值列表。

返回值：

- Continuation\<MethodActionSelector\<TRet>> - 定义了桩签名按序返回指定值的行为的 Continuation\<TRet>  对象实例。

异常：

- IllegalArgumentException - 当参数列表为空时，抛出异常。

## func returnsConsecutively(ArrayList<TRet>)

### 签名

```cangjie role=signature
func returnsConsecutively(values: ArrayList<TRet>): Continuation<MethodActionSelector<TRet>>
```

定义桩签名按列表顺序返回指定的值的行为。

### 契约

功能：定义桩签名按列表顺序返回指定的值的行为。桩签名将被连续调用多次，次数与数组列表内值的个数相同。

参数：

- values: ArrayList\<TRet> - 桩签名的返回值列表。

返回值：

- Continuation\<MethodActionSelector\<TRet>> - 定义了桩签名按序返回指定值的 Continuation\<TRet> 对象实例。

异常：

- IllegalArgumentException - 当参数列表为空时，抛出异常。
