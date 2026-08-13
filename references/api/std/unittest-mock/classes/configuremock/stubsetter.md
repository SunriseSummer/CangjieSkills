<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.configuremock.stubsetter" parent="std.unittest.mock.class.configuremock" -->
# ConfigureMock.stubSetter

[← ConfigureMock](index.md)

## 签名

```cangjie role=signature
public static func stubSetter<TArg>(
    stubCall: () -> Unit,
    _: () -> TArg,
    matcher: ArgumentMatcher,
    prefixRefName: Option<String>,
    fieldOrPropertyName: String,
    callDescription: String,
    lineNumber: Int64
): SetterActionSelector<TArg>
```

创建针对属性 Setter 方法插入桩代码的操作器对象。

## 契约

参数：

- stubCall: () -> Unit - 桩签名对应的调用表达式。
- _: () -> TArg - 用于捕获属性或者字段的类型。
- matcher: ArgumentMatcher - 入参的参数匹配器。
- prefixRefName: Option\<String> - 用于模拟类/接口成员的对象引用令牌，用于模拟静态声明的类型引用令牌，用于顶级声明的时为 None。
- fieldOrPropertyName: String - 被插桩的属性或字段的名称。
- callDescription: String - 桩签名对应的调用表达式的字符串表达。
- lineNumber: Int64 - 对应的调用表达式的行号。

返回值：

- MethodActionSelector\<TRet> - 针对普通成员方法插入桩代码的操作器对象。
