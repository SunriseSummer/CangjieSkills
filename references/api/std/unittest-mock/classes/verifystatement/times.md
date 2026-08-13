<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.verifystatement.times" parent="std.unittest.mock.class.verifystatement" -->
# VerifyStatement.times

[← VerifyStatement](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func times(Int64)

### 签名

```cangjie role=signature
public func times(expectedTimes: Int64): VerifyStatement
```

指定此“验证语句”验证在验证范围内“桩签名”被执行指定次数。

### 契约

参数：

- expectedTimes: Int64 - 预期验证的执行次数。

返回值：

- VerifyStatement - 返回对象自身。

异常：

- MockFrameworkException - 当对象已被指定过执行次数或已被传入过“验证动作”中时，将抛出异常。
- IllegalArgumentException - 当作为`expectedTimes`参数传递的数字为负数时，抛出异常。

## func times(Int64, Int64)

### 签名

```cangjie role=signature
public func times(min!: Int64, max!: Int64): VerifyStatement
```

指定此“验证语句”验证在验证范围内“桩签名”的执行次数在指定范围内。

### 契约

参数：

- min!: Int64 - 预期验证的最小执行次数。
- max!: Int64 - 预期验证的最大执行次数。

返回值：

- VerifyStatement - 返回对象自身。

异常：

- MockFrameworkException - 当对象已被指定过执行次数或已被传入过“验证动作”中时，将抛出异常。
- IllegalArgumentException - 当传入的`min`或`max`参数为负数时，抛出异常。
