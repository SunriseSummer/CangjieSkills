<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.getteractionselector.returns" parent="std.unittest.mock.class.getteractionselector" -->
# GetterActionSelector<TRet>.returns

[← GetterActionSelector<TRet>](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## func returns(TRet)

### 签名

```cangjie role=signature
public func returns(value: TRet): CardinalitySelector<GetterActionSelector<TRet>>
```

指定返回值。

### 契约

参数：

- value: TRet - 指定的返回的值。

返回值：

- CardinalitySelector\<GetterActionSelector\<TRet>> - 预期执行次数的操作器。

## func returns(() -> TRet)

### 签名

```cangjie role=signature
public func returns(valueFactory: () -> TRet): CardinalitySelector<GetterActionSelector<TRet>>
```

指定返回值。

### 契约

参数：

- valueFactory: () -> TRet - 指定的返回的值生成器。

返回值：

- CardinalitySelector\<GetterActionSelector\<TRet>> - 预期执行次数的操作器。

## func returns()

适用扩展：[extend MethodActionSelector<Unit>](extensions/extend-methodactionselector-unit.md)。

### 签名

```cangjie role=signature
public func returns(): CardinalitySelector<MethodActionSelector<TRet>>
```

指定桩函数什么都不做。

### 契约

返回值：

- CardinalitySelector\<MethodActionSelector\<TRet>> - 预期执行次数的操作器。
