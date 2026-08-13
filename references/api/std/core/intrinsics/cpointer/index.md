<!-- cj-doc kind="api-type" level="5" id="std.core.intrinsic.cpointer" parent="std.core" -->
# CPointer<T>

[← std.core](../../index.md)

表示 `T` 类型实例的指针，在与 C 语言互操作的场景下使用，对应 C 语言的 `T*`。

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend<T> CPointer<T>`](extensions/extend-t-cpointer-t.md) | 为 CPointer<T> 扩展一些必要的指针使用相关接口，包含判空、读写数据等接口。 |
