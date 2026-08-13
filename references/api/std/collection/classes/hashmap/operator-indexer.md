<!-- cj-doc kind="api-member" level="6" id="std.collection.class.hashmap.operator-indexer" parent="std.collection.class.hashmap" -->
# HashMap<K, V> where K <: Hashable & Equatable<K>.[]

[← HashMap<K, V> where K <: Hashable & Equatable<K>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## operator func \[](K)

### 签名

```cangjie role=signature
public operator func [](key: K): V
```

运算符重载 get 方法，如果键存在，返回键对应的值。

### 契约

参数：

- key: K - 传递值进行判断。

返回值：

- V - 与键对应的值。

异常：

- NoneValueException - 如果该 HashMap 不存在该键，抛此异常。

## operator func \[](K, V)

### 签名

```cangjie role=signature
public operator func [](key: K, value!: V): Unit
```

运算符重载 add 方法，如果键存在，新 value 覆盖旧 value，如果键不存在，添加此键值对。

### 契约

参数：

- key: K - 传递值进行判断。
- value!: V - 传递要设置的值。
