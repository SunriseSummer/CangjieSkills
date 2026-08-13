<!-- cj-doc kind="api-member" level="5" id="std.unittest.testmacro.macro.parallel" parent="std.unittest.testmacro" -->
# @Parallel

[← std.unittest.testmacro](../index.md)

## 签名

```cangjie role=signature
@Parallel
```

`@Parallel` 宏可以修饰测试类。

## 契约

功能：`@Parallel` 宏可以修饰测试类。被 `@Parallel` 修饰的测试类中的测试用例可并行执行。该配置仅在 `--parallel` 运行模式下生效。

1. 所有相关的测试用例应该各自独立，不依赖于任何可变的共享的状态值。
2. `beforeAll()` 和 `afterAll()` 应该是可重入的，以便可以在不同的进程中多次运行。
3. 需要并行化的测试用例本身应耗时较长。否则并行化引入的多次 `beforeAll()` 和 `afterAll()` 可能会超过并行化的收益。
4. 不允许与 `@Bench` 同时使用。由于性能用例对底层资源敏感，用例是否并行执行，将影响性能用例的结果，因此禁止与 `@Bench` 同时使用。
