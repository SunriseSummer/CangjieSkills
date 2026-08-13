<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.configuremock.stubfunction" parent="std.unittest.mock.class.configuremock" -->
# ConfigureMock.stubFunction

[← ConfigureMock](index.md)

## 签名

```cangjie role=signature
public static func stubFunction<TRet>(
    stubCall: () -> TRet,
    matchers: Array<ArgumentMatcher>,
    prefixRefName: Option<String>,
    methodName: String,
    callDescription: String,
    lineNumber: Int64
): MethodActionSelector<TRet>
```

创建针对普通成员方法插入桩代码的操作器对象。

## 契约

参数：

- stubCall: () -> Unit - 桩签名对应的调用表达式。
- _: () -> TArg - 用于捕获属性或者字段的类型。
- matchers: Array\<ArgumentMatcher> - 对应入参的参数匹配器。
- prefixRefName: Option\<String> - 用于模拟类/接口成员的对象引用令牌，用于模拟静态声明的类型引用令牌，用于顶级声明的时为 None。
- methodName: String - 方法的名称。
- callDescription: String - 桩签名对应的调用表达式的字符串表达。
- lineNumber: Int64 - 对应的调用表达式的行号。

返回值：

- MethodActionSelector\<TRet> - 针对普通成员方法插入桩代码的操作器对象。
