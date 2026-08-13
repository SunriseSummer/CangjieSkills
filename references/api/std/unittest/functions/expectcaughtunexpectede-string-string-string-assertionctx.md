<!-- cj-doc kind="api-member" level="5" id="std.unittest.func.expectcaughtunexpectede-string-string-string-assertionctx" parent="std.unittest" -->
# expectCaughtUnexpectedE(String, String, String, ?AssertionCtx)

[← std.unittest](../index.md)

## 签名

```cangjie role=signature
public func expectCaughtUnexpectedE(
    message: String,
    expectedExceptions: String,
    caughtException: String,
    optParentCtx!: ?AssertionCtx = None
): Unit
```

捕获的异常不符合预期，记录信息，不抛出异常。

## 契约

参数：

- message: String - 不符合预期时的提示信息。
- expectedExceptions: String - 期望的捕获的异常。
- caughtException: String - 实际捕获的异常。
- optParentCtx!: Option\<AssertionCtx> - 存储嵌套断言失败消息的上下文。
