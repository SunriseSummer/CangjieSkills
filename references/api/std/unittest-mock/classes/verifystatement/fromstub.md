<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.verifystatement.fromstub" parent="std.unittest.mock.class.verifystatement" -->
# VerifyStatement.fromStub

[← VerifyStatement](index.md)

## 签名

```cangjie role=signature
public static func fromStub<R>(
    stubCall: () -> R,
    matchers: Array<ArgumentMatcher>,
    objName: Option<String>,
    declarationName: String,
    callDescription: String,
    _: Int64
): VerifyStatement
```

构造一个 VerifyStatement。

## 契约

功能：构造一个 VerifyStatement。框架内部使用，不建议用户直接调用。

参数：

- stubCall: () -> R - 桩签名对应的调用表达式。
- matchers: Array\<ArgumentMatcher> - 入参的参数匹配器。
- objName: Option\<String> - 被插桩的对象的名称。
- declarationName: String - 声明的名称。
- callDescription: String - 桩签名对应的调用表达式的字符串表达。
- _: Int64 - 行号。

返回值：

- VerifyStatement - 返回对象自身。
