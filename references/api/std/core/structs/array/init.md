<!-- cj-doc kind="api-member" level="6" id="std.core.struct.array.init" parent="std.core.struct.array" -->
# Array<T>.init

[← Array<T>](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public const init()
```

构造一个空数组。

## init(Int64, (Int64) -> T)

### 签名

```cangjie role=signature
public init(size: Int64, initElement: (Int64) -> T)
```

创建指定长度的数组，其中元素根据初始化函数计算获取。

### 契约

即：将 [0, size) 范围内的值分别传入初始化函数 initElement，执行得到数组对应下标的元素。

参数：

- size: Int64 - 数组大小。
- initElement: (Int64) ->T - 初始化函数。

异常：

- NegativeArraySizeException - 当 size 小于 0，抛出异常。

## init(Int64, T)

### 签名

```cangjie role=signature
public init(size: Int64, repeat!: T)
```

构造一个指定长度的数组，其中元素都用指定初始值进行初始化。

### 契约

> **注意：**
>
> 该构造函数不会拷贝 repeat， 如果 repeat 是一个引用类型，构造后数组的每一个元素都将指向相同的引用。

参数：

- size: Int64 - 数组大小，取值范围为 0, [Int64.Max]。
- repeat!: T - 数组元素初始值。

异常：

- NegativeArraySizeException - 当 size 小于 0，抛出异常。
