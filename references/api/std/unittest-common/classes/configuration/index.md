<!-- cj-doc kind="api-type" level="5" id="std.unittest.common.class.configuration" parent="std.unittest.common" -->
# Configuration

[← std.unittest.common](../../index.md)

`Configuration <: ToString`

存储 `@Configure` 宏生成的 `unittest` 配置数据的对象。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个空的 Configuration 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`clone(): Configuration`](clone.md) | 拷贝一份 Configuration 对象。 |
| [`get<T>(key: KeyFor<T>): ?T`](get.md) | 获取 key 对应的值。 |
| [`getByName<T>(name: String): ?T`](getbyname.md) | 获取 key 对应的值。 |
| [`remove<T>(key: KeyFor<T>): ?T`](remove.md) | 删除对应键名称和类型的值。 |
| [`removeByName<T>(name: String): ?T`](removebyname.md) | 删除对应键名称和类型的值。 |
| [`set<T>(key: KeyFor<T>, value: T)`](set.md) | 给对应键名称和类型设置值。 |
| [`setByName<T>(name: String, value: T): Unit`](setbyname.md) | 给对应键名称和类型设置值。 |
| [`toString(): String`](tostring.md) | 该对象的字符化对象，当内部对象未实现 ToString 接口时，输出 '<not printable>' 。 |
| [`static merge(parent: Configuration, child: Configuration): Configuration`](merge.md) | 合并 child 到 parent 配置中。 |
