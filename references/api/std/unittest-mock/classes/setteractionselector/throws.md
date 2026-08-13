<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.setteractionselector.throws" parent="std.unittest.mock.class.setteractionselector" -->
# SetterActionSelector<TRet>.throws

[← SetterActionSelector<TRet>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func throws(Exception)

### 签名

```cangjie role=signature
public func throws(exception: Exception): CardinalitySelector<SetterActionSelector<TArg>>
```

指定抛出异常。

### 契约

参数：

- exception: Exception - 指定的抛出的异常。

返回值：

- CardinalitySelector\<SetterActionSelector\<TArg>> - 预期执行次数的操作器。

## func throws(() -> Exception)

### 签名

```cangjie role=signature
public func throws(exceptionFactory: () -> Exception): CardinalitySelector<SetterActionSelector<TArg>>
```

指定抛出异常。

### 契约

参数：

- exceptionFactory: () -> Exception - 指定的抛出的异常的生成器。

返回值：

- CardinalitySelector\<SetterActionSelector\<TArg>> - 预期执行次数的操作器。
