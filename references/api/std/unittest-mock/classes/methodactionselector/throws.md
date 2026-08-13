<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.methodactionselector.throws" parent="std.unittest.mock.class.methodactionselector" -->
# MethodActionSelector<TRet>.throws

[← MethodActionSelector<TRet>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func throws(() -> Exception)

### 签名

```cangjie role=signature
func throws(exceptionFactory: () -> Exception): CardinalitySelector<MethodActionSelector<TRet>>
```

定义桩签名抛出异常的行为，异常由参数闭包函数生成。

### 契约

> **说明：**
>
> throws vs fails
>
> throws 意味着测试桩签名抛出异常后的行为是测试的目的。例如，当某些服务不可用时，系统是否可以正确恢复等。
> fails 意味着调用桩签名将导致测试失败。即，如果系统行为正确，则永远不应调用该桩签名。

参数：

- exceptionFactory: () ->Exception - 构造预期桩签名抛出的异常对象的闭包函数（生成器）。

返回值：

- CardinalitySelector\<MethodActionSelector\<TRet>> - 定义了桩签名抛出异常行为的 CardinalitySelector\<R> 对象实例。

## func throws(Exception)

### 签名

```cangjie role=signature
func throws(exception: Exception): CardinalitySelector<MethodActionSelector<TRet>>
```

定义桩签名抛出异常的行为。

### 契约

参数：

- exception: Exception - 预期桩签名抛出的异常对象。

返回值：

- CardinalitySelector\<MethodActionSelector\<TRet>>  - 定义了桩签名抛出异常的行为的 CardinalitySelector\<R> 对象实例。
