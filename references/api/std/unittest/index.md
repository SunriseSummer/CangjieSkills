<!-- cj-doc kind="api-package" level="4" id="std.unittest" parent="api.std" -->
# std.unittest

[← std 包索引](../index.md)

提供单元测试与基准测试的声明、断言、生命周期、参数化和扩展机制。

包路径：`std.unittest`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`AssertionCtx`](classes/assertionctx/index.md) | 存储用户定义的断言的状态。 |
| [`Benchmark`](classes/benchmark/index.md) | 该类提供创建和运行单个性能测试用例的方法。 |
| [`BenchReport <: Report`](classes/benchreport/index.md) | 提供性能用例执行结果报告处理能力。 |
| [`CartesianProductProcessor<T0, T1> <: DataStrategyProcessor<(T0, T1)>`](classes/cartesianproductprocessor/index.md) | 笛卡尔积处理器。 |
| [`ConsoleReporter <: Reporter<TestReport, Unit> & Reporter<BenchReport, Unit>`](classes/consolereporter/index.md) | 打印单元测试用例结果或者性能测试用例结果到控制台。 |
| [`TextReporter<PP> <: Reporter<TestReport, PP> & Reporter<BenchReport, PP> where PP <: PrettyPrinter`](classes/textreporter/index.md) | 将单元测试用例结果或性能测试结果打印到 PrettyPrinter 的子类。 |
| [`CsvReporter <: Reporter<BenchReport, Unit>`](classes/csvreporter/index.md) | 打印性能测试用例结果数据到 CSV 文件上。 |
| [`CsvRawReporter <: Reporter<BenchReport, Unit>`](classes/csvrawreporter/index.md) | 打印性能测试用例结果数据，该数据只有批次的原始测量值，到 CSV 文件上。 |
| [`abstract sealed DataStrategyProcessor<T>`](classes/datastrategyprocessor/index.md) | 所有 DataStrategy 组件的基类。 |
| [`FlatMapProcessor<T,R> <: DataStrategyProcessor<R>`](classes/flatmapprocessor-t-r.md) | 对参数数据进行 FlatMap 的处理器。 |
| [`FlatMapStrategyProcessor<T,R> <: DataStrategyProcessor<R>`](classes/flatmapstrategyprocessor-t-r.md) | 对参数数据进行 FlatMap 的处理器。 |
| [`InputParameter`](classes/inputparameter.md) | 入参对象类型。 |
| [`open LazyCyclicNode`](classes/lazycyclicnode/index.md) | 用于在一个循环中一个接一个地推进类型擦除的内部惰性迭代器。 |
| [`MapProcessor<T,R> <: DataStrategyProcessor<R>`](classes/mapprocessor-t-r.md) | 对参数数据进行 Map 的处理器。 |
| [`PowerAssertDiagramBuilder`](classes/powerassertdiagrambuilder/index.md) | PowerAssert 输出结果构造器。 |
| [`sealed abstract Report`](classes/report/index.md) | 打印测试用例结果报告的基类。 |
| [`RawStatsReporter <: Reporter<BenchReport, HashMap<String, (Float64, Float64)>>`](classes/rawstatsreporter/index.md) | 未处理的性能测试数据报告器。 |
| [`SimpleProcessor<T> <: DataStrategyProcessor<T>`](classes/simpleprocessor/index.md) | 简单的数据策略处理器。 |
| [`TestGroup`](classes/testgroup/index.md) | 提供构建和运行测试组合方法的类。 |
| [`TestGroupBuilder`](classes/testgroupbuilder/index.md) | 提供配置测试组合的方法的构造器。 |
| [`TestPackage`](classes/testpackage/index.md) | 用例包对象。 |
| [`TestReport <: Report`](classes/testreport/index.md) | 单元测试执行结果报告。 |
| [`TestSuite`](classes/testsuite/index.md) | 提供构建和执行测试套方法的类。 |
| [`TestSuiteBuilder`](classes/testsuitebuilder/index.md) | 提供配置测试套方法的测试套构造器。 |
| [`UnitTestCase`](classes/unittestcase/index.md) | 提供创建和执行单元测试用例的方法的类。 |
| [`XmlReporter <: Reporter<TestReport, Unit>`](classes/xmlreporter/index.md) | 打印单元测试用例结果数据到 Xml 文件上。 |
| [`AssertException <: Exception`](classes/assertexception/index.md) | @Expect / @Assert 检查失败时所抛出的异常。 |
| [`AssertIntermediateException <: Exception`](classes/assertintermediateexception/index.md) | @PowerAssert 检查失败时所抛出的异常。 |
| [`UnittestCliOptionsFormatException <: UnittestException`](classes/unittestclioptionsformatexception.md) | 控制台选项格式错误抛出的异常。 |
| [`open UnittestException <: Exception`](classes/unittestexception/index.md) | 框架通用异常。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`BenchInputProvider<T> <: BenchmarkInputMarker`](interfaces/benchinputprovider/index.md) | 当某些代码需要在性能测试执行前执行，或当输入变化就需要重新执行一段代码时，可实现本接口。 |
| [`BenchmarkConfig`](interfaces/benchmarkconfig/index.md) | 该接口提供为 Configuration 宏配置性能测试相关信息的函数签名。 |
| [`BenchmarkInputMarker`](interfaces/benchmarkinputmarker.md) | 当我们不知道 `T` 时，该接口能够检测 `BenchInputProvider<T>` 。 |
| [`Measurement`](interfaces/measurement/index.md) | 该接口指定如何在性能测试期间测量数据以及如何在报告中显示数据。 |
| [`NearEquatable<CT, D>`](interfaces/nearequatable/index.md) | 判断某个对象是否基于这个 delta 近似相等。 |
| [`sealed Reporter <TReport, TReturn>`](interfaces/reporter.md) | 报告器基础接口。 |
| [`TestClass`](interfaces/testclass/index.md) | 提供创建 TestSuite 的方法。 |

## 结构体

| 声明 | 功能 |
|---|---|
| [`BatchInputProvider<T> <: BenchInputProvider<T>`](structs/batchinputprovider/index.md) | 输入提供程序，在执行之前在缓冲区中生成整个基准批次的输入。 |
| [`BatchSizeOneInputProvider<T> <: BenchInputProvider<T>`](structs/batchsizeoneinputprovider/index.md) | 基准输入提供程序，在每次执行基准之前生成输入。 |
| [`CpuCycles <: Measurement`](structs/cpucycles/index.md) | 使用本机 `rdtscp` 指令测量 CPU 周期数。 |
| [`GenerateEachInputProvider<T> <: BenchInputProvider<T>`](structs/generateeachinputprovider/index.md) | 基准输入提供程序，在每次执行基准之前生成输入。 |
| [`ImmutableInputProvider<T> <: BenchInputProvider<T>`](structs/immutableinputprovider/index.md) | 最简单的输入提供程序，只需为基准测试的每次调用复制数据。 |
| [`KeyBaseline <: KeyFor<String>`](structs/keybaseline/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyBaselinePath <: KeyFor<String>`](structs/keybaselinepath/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyBatchSize <: KeyFor<Int64> & KeyFor<Range<Int64>>`](structs/keybatchsize/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyBench <: KeyFor<Bool>`](structs/keybench/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyCaptureOutput <: KeyFor<Bool>`](structs/keycaptureoutput/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyCoverageGuided <: KeyFor<Bool>`](structs/keycoverageguided/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyCoverageGuidedBaselineScore <: KeyFor<Int64>`](structs/keycoverageguidedbaselinescore/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyCoverageGuidedInitialSeeds <: KeyFor<Int64>`](structs/keycoverageguidedinitialseeds/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyCoverageGuidedMaxCandidates <: KeyFor<Int64>`](structs/keycoverageguidedmaxcandidates/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyCoverageGuidedNewCoverageBonus <: KeyFor<Int64>`](structs/keycoverageguidednewcoveragebonus/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyCoverageGuidedNewCoverageScore <: KeyFor<Int64>`](structs/keycoverageguidednewcoveragescore/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyDeathAware <: KeyFor<Bool>`](structs/keydeathaware/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyDryRun <: KeyFor<Bool>`](structs/keydryrun/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyExcludeTags <: KeyFor<String>`](structs/keyexcludetags/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyExplicitGC <: KeyFor<ExplicitGcType>`](structs/keyexplicitgc/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyFilter <: KeyFor<String>`](structs/keyfilter/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyFromTopLevel <: KeyFor<Bool>`](structs/keyfromtoplevel/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyGenerationSteps <: KeyFor<Int64>`](structs/keygenerationsteps/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyHelp <: KeyFor<Bool>`](structs/keyhelp/index.md) | 用于在配置信息中指定是否打印帮助信息。 |
| [`KeyIncludeTags <: KeyFor<String>`](structs/keyincludetags/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyInternalTestrunnerInputPath <: KeyFor<String>`](structs/keyinternaltestrunnerinputpath/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyMeasurement <: KeyFor<Measurement>`](structs/keymeasurement/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyMeasurementInfo <: KeyFor<MeasurementInfo>`](structs/keymeasurementinfo/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyMinBatches <: KeyFor<Int64>`](structs/keyminbatches/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyMinDuration <: KeyFor<Duration>`](structs/keyminduration/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyNoCaptureOutput <: KeyFor<Bool>`](structs/keynocaptureoutput/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyNoColor <: KeyFor<Bool>`](structs/keynocolor/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyOptimizeMocksForBench <: KeyFor<Bool>`](structs/keyoptimizemocksforbench/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyParallel <: KeyFor<Bool> & KeyFor<String> & KeyFor<Int64>`](structs/keyparallel/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyRandomSeed <: KeyFor<Int64>`](structs/keyrandomseed/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyReductionSteps <: KeyFor<Int64>`](structs/keyreductionsteps/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyReportFormat <: KeyFor<String>`](structs/keyreportformat/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyReportPath <: KeyFor<String>`](structs/keyreportpath/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyShowAllOutput <: KeyFor<Bool>`](structs/keyshowalloutput/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyShowTags <: KeyFor<Bool>`](structs/keyshowtags/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeySkip <: KeyFor<Bool>`](structs/keyskip/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyTimeout <: KeyFor<Duration>`](structs/keytimeout/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyTimeoutEach <: KeyFor<String>`](structs/keytimeouteach/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyTimeoutHandler <: KeyFor<(TestCaseInfo) -> Unit>`](structs/keytimeouthandler/index.md) | 支持在配置信息中指定超时处理的句柄。 |
| [`KeyVerbose <: KeyFor<Bool>`](structs/keyverbose/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`KeyWarmup <: KeyFor<Int64> & KeyFor<Duration>`](structs/keywarmup/index.md) | 用于在 Configuration 中作为对应配置项的键值。 |
| [`MeasurementInfo`](structs/measurementinfo/index.md) | 存储测量信息的结构体。 |
| [`Perf <: Measurement`](structs/perf/index.md) | 使用 Linux 系统调用 `perf_event_open` 测量各种硬件和软件 CPU 计数器。 |
| [`RelativeDelta<T>`](structs/relativedelta/index.md) | 对于浮点类型，提供相对的 delta 数据类型来做近似相等的计算。 |
| [`TestCaseInfo`](structs/testcaseinfo/index.md) | 当前正在运行的测试用例的信息。 |
| [`TimeNow <: Measurement`](structs/timenow/index.md) | Measurement 的实现，用于测量执行一个函数所花费的时间。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`ExplicitGcType <: ToString`](enums/explicitgctype/index.md) | 用于指定 `@Configure` 宏的 `explicitGC` 配置参数。 |
| [`TimeUnit <: ToString`](enums/timeunit/index.md) | 可以在 TimeNow 构造函数中使用的时间单位。 |
| [`PerfCounter <: ToString`](enums/perfcounter/index.md) | 枚举 Perf 构造器支持的 CPU 计数器。 |

## 类型别名

| 声明 | 功能 |
|---|---|
| [`MeasurementUnitTable = Array<(Float64, String)>`](types/measurementunittable.md) | 用作 Measurement 中性能测试结果单位转换表的“边界-单位”对数组的别名。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`assertCaughtUnexpectedE( message: String, expectedExceptions: String, caughtException: String, optParentCtx!: ?AssertionCtx = None ): Nothing`](functions/assertcaughtunexpectede-string-string-string-assertionctx.md) | 捕获的异常不符合预期，记录信息，抛出异常。 |
| [`assertEqual(…) — 2 个重载`](functions/assertequal.md) | 比较 `expected` 和 `actual` 值是否相等。 |
| [`defaultConfiguration(): Configuration`](functions/defaultconfiguration.md) | 生成默认的配置信息。 |
| [`entryMain(testPackage: TestPackage): Int64`](functions/entrymain-testpackage.md) | 提供给 `cjc --test` 使用，框架执行测试用例的入口函数。 |
| [`expectCaughtUnexpectedE( message: String, expectedExceptions: String, caughtException: String, optParentCtx!: ?AssertionCtx = None ): Unit`](functions/expectcaughtunexpectede-string-string-string-assertionctx.md) | 捕获的异常不符合预期，记录信息，不抛出异常。 |
| [`expectEqual(…) — 2 个重载`](functions/expectequal.md) | 比较 `expected` 和 `actual` 值是否相等。 |
| [`fail(message: String): Nothing`](functions/fail-string.md) | 使该用例失败，直接抛出异常。 |
| [`failExpect(message: String): Unit`](functions/failexpect-string.md) | 使该用例失败，记录信息，不抛出异常。 |
| [`invokeCustomAssert<T>( passerdArgs: Array<String>, caller: String, assert: (AssertionCtx) -> T, optParentCtx!: ?AssertionCtx = None ): T`](functions/invokecustomassert-t-array-string-string-assertionctx-t-assertionctx.md) | 运行在 `@Test`, `@TestCase`，或 `@CustomAssertion` 宏中使用的 `@Assert\[caller\](passerArgs)` 指定的用户定义断言函数。 |
| [`invokeCustomExpect( passerdArgs: Array<String>, caller: String, expect: (AssertionCtx) -> Any, optParentCtx!: ?AssertionCtx = None ): Unit`](functions/invokecustomexpect-array-string-string-assertionctx-any-assertionctx.md) | 运行在 `@Test`, `@TestCase`, 或 `@CustomAssertion` 宏中使用的 `@Expect\[caller\](passerArgs)` 指定的用户定义断言函数。 |
| [`isNearExpansion(…) — 2 个重载`](functions/isnearexpansion.md) | 判断两个参数是否近似相等。 |
