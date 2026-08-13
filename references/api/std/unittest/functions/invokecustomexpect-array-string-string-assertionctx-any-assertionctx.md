<!-- cj-doc kind="api-member" level="5" id="std.unittest.func.invokecustomexpect-array-string-string-assertionctx-any-assertionctx" parent="std.unittest" -->
# invokeCustomExpect(Array<String>, String, (AssertionCtx) -> Any, ?AssertionCtx)

[← std.unittest](../index.md)

## 签名

```cangjie role=signature
public func invokeCustomExpect(
    passerdArgs: Array<String>,
    caller: String,
    expect: (AssertionCtx) -> Any,
    optParentCtx!: ?AssertionCtx = None
): Unit
```

运行在 `@Test`, `@TestCase`, 或 `@CustomAssertion` 宏中使用的 `@Expect\[caller\](passerArgs)` 指定的用户定义断言函数。

## 契约

参数：

- passedArgs: Array\<String> - 未处理的已传递参数。
- caller: String - 调用的自定义断言的名称。
- expect: (AssertionCtx) -> Any - 捕获带有正确参数的断言调用。
- optParentCtx!: Option\<AssertionCtx> - 存储嵌套断言失败消息的上下文。
