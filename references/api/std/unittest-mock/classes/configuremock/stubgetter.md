<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.configuremock.stubgetter" parent="std.unittest.mock.class.configuremock" -->
# ConfigureMock.stubGetter

[← ConfigureMock](index.md)

## 签名

```cangjie role=signature
public static func stubGetter<TRet>(
    stubCall: () -> TRet,
    prefixRefName: Option<String>,
    fieldOrPropertyName: String,
    callDescription: String,
    lineNumber: Int64
): GetterActionSelector<TRet>
```

创建针对属性的 Getter 方法插入桩代码的操作器对象。

## 契约

参数：

- stubCall: () -> TRet - 桩签名对应的调用表达式。
- prefixRefName: Option\<String> - 用于模拟类/接口成员的对象引用令牌，用于模拟静态声明的类型引用令牌，用于顶级声明的时为 None。
- fieldOrPropertyName: String - 被插桩的字段或属性名称。
- callDescription: String - 桩签名对应的调用表达式的字符串表达。
- lineNumber: Int64 - 对应的调用表达式的行号。

返回值：

- GetterActionSelector\<TRet> - 针对属性的 Getter 方法插入桩代码的操作器对象。
