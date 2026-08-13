<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.verify.ordered" parent="std.unittest.mock.class.verify" -->
# Verify.ordered

[← Verify](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func ordered((OrderedVerifier) -> Unit)

### 签名

```cangjie role=signature
public static func ordered( collectStatements: (OrderedVerifier) -> Unit): Unit
```

此函数支持验证“验证语句”是否被执行或执行的次数是否符合定义，并且校验执行顺序。

### 契约

功能：此函数支持验证“验证语句”是否被执行或执行的次数是否符合定义，并且校验执行顺序。默认情况下，“验证语句”的执行次数为一次。
传入列表中的“验证语句”必须是不相交的（即当单个调用行为，可以匹配多个“验证语句”时，将抛出异常）。
“验证语句”通过入参中的闭包动态增加。
验证模式为 `exhaustive` (全量匹配，验证范围内的所有执行情况都应在验证动作中被指定)。

参数：

- collectStatements: (OrderedVerifier) ->Unit - 支持可动态增加“验证语句”的闭包。

异常：

- VerificationFailedException - 验证不通过时，抛出异常。

## static func ordered(Array<VerifyStatement>)

### 签名

```cangjie role=signature
public static func ordered(statements: Array<VerifyStatement>): Unit
```

此函数支持验证“验证语句”是否被执行或执行的次数是否符合定义，并且校验执行顺序。

### 契约

功能：此函数支持验证“验证语句”是否被执行或执行的次数是否符合定义，并且校验执行顺序。默认情况下，“验证语句”的执行次数为一次。
传入列表中的“验证语句”必须是不相交的（即当单个调用行为，可以匹配多个“验证语句”时，将抛出异常）。
验证模式为 `exhaustive` (全量匹配，验证范围内的所有执行情况都应在验证动作中被指定)。
