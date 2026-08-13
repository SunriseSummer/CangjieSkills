<!-- cj-doc kind="api-extension" level="6" id="std.core.intrinsic.cpointer.extension.extend-t-cpointer-t" parent="std.core.intrinsic.cpointer" -->
# extend<T> CPointer<T>

[← CPointer<T>](../index.md)

`extend<T> CPointer<T>`

为 CPointer<T> 扩展一些必要的指针使用相关接口，包含判空、读写数据等接口。

## 成员

| 签名 | 功能 |
|---|---|
| [`asResource(): CPointerResource<T>`](../asresource.md) | 获取该指针 CPointerResource 实例，该实例可以在 `try-with-resource` 语法上下文中实现内容自动释放。 |
| [`isNotNull(): Bool`](../isnotnull.md) | 判断指针是否不为空。 |
| [`isNull(): Bool`](../isnull.md) | 判断指针是否为空。 |
| [`unsafe read(): T`](../read.md) | 读取第一个数据，该接口需要用户保证指针的合法性，否则发生未定义行为。 |
| [`unsafe read(idx: Int64): T`](../read.md) | 根据下标读取对应的数据，该接口需要用户保证指针的合法性，否则发生未定义行为。 |
| [`toUIntNative(): UIntNative`](../touintnative.md) | 获取该指针的整型形式。 |
| [`unsafe write(idx: Int64, value: T): Unit`](../write.md) | 在指定下标位置写入一个数据，该接口需要用户保证指针的合法性，否则发生未定义行为。 |
| [`unsafe write(value: T): Unit`](../write.md) | 写入一个数据，该数据总是在第一个，该接口需要用户保证指针的合法性，否则发生未定义行为。 |
| [`unsafe operator +(offset: Int64): CPointer<T>`](../operator-add.md) | CPointer 对象指针后移，同 C 语言的指针加法操作。 |
| [`unsafe operator -(offset: Int64): CPointer<T>`](../operator-sub.md) | CPointer 对象指针前移，同 C 语言的指针减法操作。 |
