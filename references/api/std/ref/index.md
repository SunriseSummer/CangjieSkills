<!-- cj-doc kind="api-package" level="4" id="std.ref" parent="api.std" -->
# std.ref

[← std 包索引](../index.md)

提供弱引用与清理相关能力。

包路径：`std.ref`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`WeakRef<T> <: WeakRefBase where T <: Object`](classes/weakref/index.md) | 此类提供弱引用相关的功能，如果一个对象的引用被标记为弱引用，那么即使引用不为空并且该对象的可达性成立， GC 也可以按照指定的回收策略回收它。 |
| [`sealed abstract WeakRefBase`](classes/weakrefbase.md) | 此类不包含任何公开成员和公开函数，也不允许被继承、扩展，仅作为 WeakRef 的基类。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`CleanupPolicy <: Equatable<CleanupPolicy>`](enums/cleanuppolicy/index.md) | 该枚举表示不同的弱引用清理策略，分别为 `EAGER` 和 `DEFERRED`。 |
