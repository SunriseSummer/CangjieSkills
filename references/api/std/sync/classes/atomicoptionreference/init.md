<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicoptionreference.init" parent="std.sync.class.atomicoptionreference" -->
# AtomicOptionReference<T> where T <: Object.init

[← AtomicOptionReference<T> where T <: Object](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

构造一个空的 AtomicOptionReference 实例。

## init(Option<T>)

### 签名

```cangjie role=signature
public init(val: Option<T>)
```

构造一个封装 Option<T> 数据类型的原子类型 AtomicOptionReference 的实例，其内部数据初始值为入参 `val` 的值。

### 契约

参数：

- val: Option\<T> - 原子类型的初始值。
