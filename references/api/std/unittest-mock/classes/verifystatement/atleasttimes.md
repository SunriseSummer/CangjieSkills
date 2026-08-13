<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.verifystatement.atleasttimes" parent="std.unittest.mock.class.verifystatement" -->
# VerifyStatement.atLeastTimes

[← VerifyStatement](index.md)

## 签名

```cangjie role=signature
public func atLeastTimes(minTimesExpected: Int64): VerifyStatement
```

指定此“验证语句”验证在验证范围内“桩签名”最少执行指定的次数。

## 契约

参数：

- minTimesExpected: Int64 - 预期验证的执行最少次数。

返回值：

- VerifyStatement - 返回对象自身。

异常：

- MockFrameworkException - 当对象已被指定过执行次数或已被传入过“验证动作”中时，将抛出异常。
- IllegalArgumentException - 当作为`minTimesExpected`参数传递的数字为负数时，抛出异常。
