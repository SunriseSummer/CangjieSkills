<!-- cj-doc kind="api-type" level="5" id="std.unittest.mock.class.configuremock" parent="std.unittest.mock" -->
# ConfigureMock

[← std.unittest.mock](../../index.md)

`ConfigureMock`

配置 `mock object` 。

## 方法

| 签名 | 功能 |
|---|---|
| [`static stubGetter<TRet>( stubCall: () -> TRet, prefixRefName: Option<String>, fieldOrPropertyName: String, callDescription: String, lineNumber: Int64 ): GetterActionSelector<TRet>`](stubgetter.md) | 创建针对属性的 Getter 方法插入桩代码的操作器对象。 |
| [`static stubFunction<TRet>( stubCall: () -> TRet, matchers: Array<ArgumentMatcher>, prefixRefName: Option<String>, methodName: String, callDescription: String, lineNumber: Int64 ): MethodActionSelector<TRet>`](stubfunction.md) | 创建针对普通成员方法插入桩代码的操作器对象。 |
| [`static stubSetter<TArg>( stubCall: () -> Unit, _: () -> TArg, matcher: ArgumentMatcher, prefixRefName: Option<String>, fieldOrPropertyName: String, callDescription: String, lineNumber: Int64 ): SetterActionSelector<TArg>`](stubsetter.md) | 创建针对属性 Setter 方法插入桩代码的操作器对象。 |
