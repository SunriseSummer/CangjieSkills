<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.verify.unordered" parent="std.unittest.mock.class.verify" -->
# Verify.unordered

[← Verify](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## static func unordered((UnorderedVerifier) -> Unit)

### 签名

```cangjie role=signature
public static func unordered(collectStatements: (UnorderedVerifier) -> Unit): Unit
```

此函数支持验证“验证语句”是否被执行或执行的次数是否符合定义，并且不校验执行顺序。

### 契约

功能：此函数支持验证“验证语句”是否被执行或执行的次数是否符合定义，并且不校验执行顺序。默认情况下，“验证语句”的执行次数为至少一次。
传入列表中的“验证语句”必须是不相交的（即当单个调用行为，可以匹配多个“验证语句”时，将抛出异常）。
验证模式为 `exhaustive` (全量匹配，验证范围内的所有执行情况都应在验证动作中被指定)。
“验证语句”通过入参中的闭包动态增加。举例来说：

参数：

- collectStatements: (UnorderedVerifier) ->Unit - 支持可动态增加“验证语句”的闭包。

异常：

- VerificationFailedException - 验证不通过时，抛出异常。

## static func unordered(Array<VerifyStatement>)

### 签名

```cangjie role=signature
public static func unordered(statements: Array<VerifyStatement>): Unit
```

此函数支持验证“验证语句”是否被执行或执行的次数是否符合定义，并且不校验执行顺序。

### 契约

功能：此函数支持验证“验证语句”是否被执行或执行的次数是否符合定义，并且不校验执行顺序。默认情况下，“验证语句”的执行次数为至少一次。
传入列表中的“验证语句”必须是不相交的（即当单个调用行为，可以匹配多个“验证语句”时，将抛出异常）。
验证模式为 `exhaustive` (全量匹配，验证范围内的所有执行情况都应在验证动作中被指定)。

## static func unordered(Exhaustiveness, (UnorderedVerifier) -> Unit)

### 签名

```cangjie role=signature
public static func unordered(exhaustive: Exhaustiveness, collectStatements: (UnorderedVerifier) -> Unit): Unit
```

此函数支持验证“验证语句”是否被执行或执行的次数是否符合定义，并且不校验执行顺序。

### 契约

功能：此函数支持验证“验证语句”是否被执行或执行的次数是否符合定义，并且不校验执行顺序。默认情况下，“验证语句”的执行次数为至少一次。
传入列表中的“验证语句”必须是不相交的（即当单个调用行为，可以匹配多个“验证语句”时，将抛出异常）。
“验证语句”通过入参中的闭包动态增加。

参数：

- collectStatements: (UnorderedVerifier) ->Unit - 支持可动态增加“验证语句”的闭包。
- exhaustive: Exhaustiveness - 验证模式。

异常：

- VerificationFailedException - 验证不通过时，抛出异常。

## static func unordered(Exhaustiveness, Array<VerifyStatement>)

### 签名

```cangjie role=signature
public static func unordered(exhaustive: Exhaustiveness, statements: Array<VerifyStatement>): Unit
```

此函数支持验证“验证语句”是否被执行或执行的次数是否符合定义，并且不校验执行顺序。

### 契约

功能：此函数支持验证“验证语句”是否被执行或执行的次数是否符合定义，并且不校验执行顺序。默认情况下，“验证语句”的执行次数为至少一次。
传入列表中的“验证语句”必须是不相交的（即当单个调用行为，可以匹配多个“验证语句”时，将抛出异常）。

参数：

- statements: Array\<VerifyStatement> - 待验证的多条“验证语句”，变长参数语法支持参数省略 `[]` 。
- exhaustive: Exhaustiveness - 验证模式。

异常：

- VerificationFailedException - 验证不通过时，抛出异常。
