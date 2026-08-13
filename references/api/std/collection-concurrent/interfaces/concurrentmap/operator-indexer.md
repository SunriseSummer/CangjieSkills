<!-- cj-doc kind="api-member" level="6" id="std.collection.concurrent.interface.concurrentmap.operator-indexer" parent="std.collection.concurrent.interface.concurrentmap" -->
# ConcurrentMap<K, V>.[]

[← ConcurrentMap<K, V>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## operator func \[](K)

### 签名

```cangjie role=signature
operator func [](key: K): V
```

根据指定键 key 获取值。

### 契约

功能：根据指定键 key 获取值。如果键 key 存在，返回对应的值；如果不存在，抛出异常。

参数：

- key: K - 待获取其值的键。

返回值：

- V - 键 key 对应的值。

异常：

- NoneValueException - 当前映射中不存在键 key。

## operator func \[](K, V)

### 签名

```cangjie role=signature
operator func [](key: K, value!: V): Unit
```

设置指定键 key 的值为 value。

### 契约

功能：设置指定键 key 的值为 value。如果键 key 存在，新 value 覆盖旧 value；如果键不存在，添加此键值对。

参数：

- key: K - 待设置其值的键。
- value!: V - 待设置的值。
