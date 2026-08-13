<!-- cj-doc kind="api-member" level="5" id="std.unittest.func.assertequal" parent="std.unittest" -->
# assertEqual

[← std.unittest](../index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## assertEqual<T>(String, String, T, T, ?AssertionCtx)

### 签名

```cangjie role=signature
public func assertEqual<T>(
    leftStr: String,
    rightStr: String,
    expected: T,
    actual: T,
    optParentCtx!: ?AssertionCtx = None
): Unit where T <: Equatable<T>
```

比较 `expected` 和 `actual` 值是否相等。

### 契约

功能：比较 `expected` 和 `actual` 值是否相等。若不等，直接抛出异常。

参数：

- leftStr: String - 期望的表达式的字符串。
- rightStr: String - 实际的表达式的字符串。
- expected: T - 期望的值。
- actual: T - 实际值。
- optParentCtx!: Option\<AssertionCtx> - 存储嵌套断言失败消息的上下文。

## assertEqual<T>(String, String, T, T, Bool, ?AssertionCtx)

### 签名

```cangjie role=signature
public func assertEqual<T>(
    leftStr: String,
    rightStr: String,
    expected: T,
    actual: T,
    isDelta!: Bool = false,
    optParentCtx!: ?AssertionCtx = None
): Unit where T <: Equatable<T>
```

比较 `expected` 和 `actual` 值是否相等。

### 契约

功能：比较 `expected` 和 `actual` 值是否相等。若不等，直接抛出异常。

参数：

- leftStr: String - 期望的表达式的字符串。
- rightStr: String - 实际的表达式的字符串。
- expected: T - 期望的值。
- actual: T - 实际值。
- isDelta!: Bool - 是否使用近似相等。默认不使能。
- optParentCtx!: Option\<AssertionCtx> - 存储嵌套断言失败消息的上下文。
