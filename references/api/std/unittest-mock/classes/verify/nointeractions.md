<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.verify.nointeractions" parent="std.unittest.mock.class.verify" -->
# Verify.noInteractions

[← Verify](index.md)

## 签名

```cangjie role=signature
public static func noInteractions(mocks: Array<Object>): Unit
```

在验证范围内，对象没有任何执行动作时，验证通过。

## 契约

参数：

- mocks: Array\<Object> - 被验证的对象列表。

异常：

- VerificationFailedException - 验证不通过时，抛出异常。
