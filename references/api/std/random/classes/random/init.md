<!-- cj-doc kind="api-member" level="6" id="std.random.class.random.init" parent="std.random.class.random" -->
# Random.init

[← Random](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

默认无参构造函数创建新的 Random 对象。

## init(UInt64)

### 签名

```cangjie role=signature
public init(seed: UInt64)
```

使用随机数种子创建新的 Random 对象。

### 契约

参数：

- seed: UInt64 - 随机数种子，如果设置相同随机种子，生成的伪随机数列表相同。
