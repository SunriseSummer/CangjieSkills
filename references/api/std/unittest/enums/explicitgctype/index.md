<!-- cj-doc kind="api-type" level="5" id="std.unittest.enum.explicitgctype" parent="std.unittest" -->
# ExplicitGcType

[← std.unittest](../../index.md)

`ExplicitGcType <: ToString`

用于指定 `@Configure` 宏的 `explicitGC` 配置参数。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`Disabled`](value-disabled.md) | GC 不会被框架显式调用。 |
| [`Heavy`](value-heavy.md) | std.runtime.gc(heavy: true) 将在性能测试执行期间由框架显式调用。 |
| [`Light`](value-light.md) | std.runtime.gc(heavy: false) 将在 Benchmark 函数执行期间由框架显式调用。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toString(): String`](tostring.md) | GC 执行的三种不同方式字符串。 |
