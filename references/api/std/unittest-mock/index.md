<!-- cj-doc kind="api-package" level="4" id="std.unittest.mock" parent="api.std" -->
# std.unittest.mock

[← std 包索引](../index.md)

创建和配置与真实声明签名一致的 mock 对象。

包路径：`std.unittest.mock`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`sealed abstract ActionSelector`](classes/actionselector/index.md) | 此抽象类提供了为成员函数指定一个操作 API ，并允许链式调用的方法。 |
| [`AnyMatcher <: ArgumentMatcher`](classes/anymatcher/index.md) | 任意参数匹配器，即桩签名允许任意的参数。 |
| [`abstract ArgumentMatcher`](classes/argumentmatcher/index.md) | 参数匹配器抽象类，该类与其子类可作为桩签名的入参类型。 |
| [`CardinalitySelector<A> where A <: ActionSelector`](classes/cardinalityselector/index.md) | 此类提供了可定义桩签名的最近一次行为的执行次数的 API 。 |
| [`ConfigureMock`](classes/configuremock/index.md) | 配置 `mock object` 。 |
| [`Continuation<A> where A <: ActionSelector`](classes/continuation/index.md) | 此类提供了可继续定义桩签名的行为的 API 。 |
| [`GetterActionSelector<TRet> <: ActionSelector`](classes/getteractionselector/index.md) | 此类提供了为属性 `Getter` 函数指定一个操作 API ，并允许链式调用的方法。 |
| [`Matchers`](classes/matchers/index.md) | 该类提供生成匹配器的静态函数。 |
| [`MethodActionSelector<TRet> <: ActionSelector`](classes/methodactionselector/index.md) | 此类提供了为成员函数指定一个操作 API ，并允许链式调用。 |
| [`MockFramework`](classes/mockframework/index.md) | 提供用例执行所需的框架准备与结束回收阶段的函数。 |
| [`NoneMatcher <: ArgumentMatcher`](classes/nonematcher/index.md) | 参数值为 `None` 的匹配器。 |
| [`OrderedVerifier`](classes/orderedverifier/index.md) | 此类型用于收集 “验证语句”，可在 ordered 函数中动态传入验证行为。 |
| [`SetterActionSelector<TRet> <: ActionSelector`](classes/setteractionselector/index.md) | 此类提供了为属性 `Setter` 函数指定一个操作 API ，并允许链式调用的方法。 |
| [`SyntheticField<T>`](classes/syntheticfield/index.md) | 合成字段。 |
| [`abstract TypedMatcher<T> <: ArgumentMatcher`](classes/typedmatcher/index.md) | 参数类型匹配器。 |
| [`UnorderedVerifier`](classes/unorderedverifier/index.md) | 此类型用于收集 “验证语句”， 可在 unordered 函数中动态传入验证行为。 |
| [`Verify`](classes/verify/index.md) | Verify 提供了一系列静态方法来支持定义所需验证的动作，如 `that` 、 `ordered` 以及 `unorder` 。 |
| [`VerifyStatement`](classes/verifystatement/index.md) | 此类型表示对“桩签名”在验证范围内的单个验证验证语句（即上文中的“验证语句”），提供了成员函数指定“桩签名”的执行次数。 |
| [`open ExpectationFailedException <: PrettyException`](classes/expectationfailedexception.md) | 在测试执行期间违反了 mock 配置期间设置的一个或多个期望。 |
| [`MockFrameworkException <: PrettyException`](classes/mockframeworkexception.md) | 框架异常信息，用户使用 API 不满足框架要求时，抛出该异常。 |
| [`MockFrameworkInternalError <: PrettyException`](classes/mockframeworkinternalerror.md) | 框架异常信息，用户不应期望该异常被抛出。 |
| [`abstract PrettyException <: Exception & PrettyPrintable`](classes/prettyexception/index.md) | 支持 PrettyPrintable 的异常类型，可以较好得打印异常信息。 |
| [`UnhandledCallException <: PrettyException`](classes/unhandledcallexception.md) | 提供的桩均未处理该调用。 |
| [`UnnecessaryStubbingException <: PrettyException`](classes/unnecessarystubbingexception.md) | 指示被测试的代码从未触发桩。 |
| [`UnstubbedInvocationException <: PrettyException`](classes/unstubbedinvocationexception.md) | 未提供与此调用匹配的桩。 |
| [`VerificationFailedException <: PrettyException`](classes/verificationfailedexception.md) | 验证失败时，框架所抛出的异常。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`ValueListener<T>`](interfaces/valuelistener/index.md) | 此接口提供了多个成员函数以支持“监听”传入给桩签名的参数。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`Exhaustiveness`](enums/exhaustiveness/index.md) | 此枚举类型用于指定 `unordered` 函数的验证模式，包含两种模式。 |
| [`MockSessionKind`](enums/mocksessionkind/index.md) | 控制允许在 `MockSession` 使用的桩的类型。 |
| [`StubMode`](enums/stubmode/index.md) | 控制桩的模式。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`mock(…) — 2 个重载`](functions/mock.md) | 创建类型 T 的 `mock object`， 这个对象默认情况下，所有的成员函数、属性或运算符重载函数没有任何具体实现。 |
| [`spy<T>(objectToSpyOn: T): T`](functions/spy-t-t.md) | 创建类型 T 的 `spy object` （ `mock object` 的扩展，对象的成员拥有默认实现的“骨架”对象）。 |
