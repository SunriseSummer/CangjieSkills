<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.verifystatement.once" parent="std.unittest.mock.class.verifystatement" -->
# VerifyStatement.once

[← VerifyStatement](index.md)

## 签名

```cangjie role=signature
public func once(): VerifyStatement
```

指定此“验证语句”验证在验证范围内“桩签名”仅被执行一次。

## 契约

返回值：

- VerifyStatement - 返回对象自身。

异常：

- MockFrameworkException - 当对象已被指定过执行次数或已被传入过“验证动作”中时，将抛出异常。
