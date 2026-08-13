<!-- cj-doc kind="api-type" level="5" id="std.ref.class.weakref" parent="std.ref" -->
# WeakRef<T> where T <: Object

[← std.ref](../../index.md)

`WeakRef<T> <: WeakRefBase where T <: Object`

此类提供弱引用相关的功能，如果一个对象的引用被标记为弱引用，那么即使引用不为空并且该对象的可达性成立， GC 也可以按照指定的回收策略回收它。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`cleanupPolicy: CleanupPolicy`](prop-cleanuppolicy.md) | 获取该弱引用的清理策略。 |
| [`value: Option<T>`](prop-value.md) | 读取弱引用指向的对象。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(value: T, cleanupPolicy: CleanupPolicy)`](init.md) | 为 `value` 对象创建弱引用，并指定清理策略。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`clear(): Unit`](clear.md) | 强制清理弱引用指向的对象，后续对 `value` 的访问将返回 `None`。 |
