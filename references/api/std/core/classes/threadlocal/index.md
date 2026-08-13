<!-- cj-doc kind="api-type" level="5" id="std.core.class.threadlocal" parent="std.core" -->
# ThreadLocal<T>

[← std.core](../../index.md)

`ThreadLocal<T>`

该类表示仓颉线程局部变量。

## 方法

| 签名 | 功能 |
|---|---|
| [`get(): ?T`](get.md) | 获得仓颉线程局部变量的值。 |
| [`set(value: ?T): Unit`](set.md) | 通过 value 设置仓颉线程局部变量的值，如果传入 `None`，该局部变量的值将被删除，在线程后续操作中将无法获取。 |
