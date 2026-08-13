<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.class.httpheaders" parent="stdx.net.http" -->
# HttpHeaders

[← stdx.net.http](../../index.md)

`HttpHeaders <: Iterable<(String, Collection<String>)>`

此类用于表示 Http 报文中的 header 和 trailer，定义了相关增、删、改、查操作。

## 方法

| 签名 | 功能 |
|---|---|
| [`add(name: String, value: String): Unit`](add.md) | 添加指定键值对。 |
| [`del(name: String): Unit`](del.md) | 删除指定 name 对应的键值对。 |
| [`get(name: String): Collection<String>`](get.md) | 获取指定 name 对应的 value 值。 |
| [`getFirst(name: String): ?String`](getfirst.md) | 获取指定 name 对应的第一个 value 值。 |
| [`isEmpty(): Bool`](isempty.md) | 判断当前实例是否为空，即没有任何键值对。 |
| [`iterator(): Iterator<(String, Collection<String>)>`](iterator.md) | 获取迭代器，可用于遍历所有键值对。 |
| [`set(name: String, value: String): Unit`](set.md) | 设置指定键值对。 |
