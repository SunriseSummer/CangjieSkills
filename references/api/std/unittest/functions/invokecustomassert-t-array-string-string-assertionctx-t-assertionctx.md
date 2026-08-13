<!-- cj-doc kind="api-member" level="5" id="std.unittest.func.invokecustomassert-t-array-string-string-assertionctx-t-assertionctx" parent="std.unittest" -->
# invokeCustomAssert<T>(Array<String>, String, (AssertionCtx) -> T, ?AssertionCtx)

[← std.unittest](../index.md)

## 签名

```cangjie role=signature
public func invokeCustomAssert<T>(
    passerdArgs: Array<String>,
    caller: String,
    assert: (AssertionCtx) -> T,
    optParentCtx!: ?AssertionCtx = None
): T
```

运行在 `@Test`, `@TestCase`，或 `@CustomAssertion` 宏中使用的 `@Assert\[caller\](passerArgs)` 指定的用户定义断言函数。

## 契约

参数：

- passedArgs: Array\<String> - 未处理的已传递参数。
- caller: String - 调用的自定义断言的名称。
- assert: (AssertionCtx) -> T - 捕获带有正确参数的断言调用。
- optParentCtx!: Option\<AssertionCtx> - 存储嵌套断言失败消息的上下文。

返回值：

- T - 由用户定义的断言返回的值。
