<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.verify.that" parent="std.unittest.mock.class.verify" -->
# Verify.that

[← Verify](index.md)

## 签名

```cangjie role=signature
public static func that(statement: VerifyStatement): Unit
```

验证是否正确执行了传入的单个“验证语句”。

## 契约

参数：

- statement: VerifyStatement - 所需验证的“验证语句”。

异常：

- VerificationFailedException - 验证不通过时，将抛出异常。
