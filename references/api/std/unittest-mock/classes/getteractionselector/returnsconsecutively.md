<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.getteractionselector.returnsconsecutively" parent="std.unittest.mock.class.getteractionselector" -->
# GetterActionSelector<TRet>.returnsConsecutively

[← GetterActionSelector<TRet>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func returnsConsecutively(Array<TRet>)

### 签名

```cangjie role=signature
public func returnsConsecutively(values: Array<TRet>): Continuation<GetterActionSelector<TRet>>
```

指定返回多个值。

### 契约

参数：

- values: Array\<TRet> - 指定的返回的多个值。

返回值：

- Continuation\<GetterActionSelector\<TRet>> - 预期执行次数的操作器。

## func returnsConsecutively(ArrayList<TRet>)

### 签名

```cangjie role=signature
public func returnsConsecutively(values: ArrayList<TRet>): Continuation<GetterActionSelector<TRet>>
```

指定返回多个值。

### 契约

参数：

- values: ArrayList\<TRet> - 指定的返回的多个值。

返回值：

- Continuation\<GetterActionSelector\<TRet>> - 预期执行次数的操作器。
