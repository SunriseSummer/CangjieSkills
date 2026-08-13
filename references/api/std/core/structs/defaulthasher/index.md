<!-- cj-doc kind="api-type" level="5" id="std.core.struct.defaulthasher" parent="std.core" -->
# DefaultHasher

[← std.core](../../index.md)

`DefaultHasher <: Hasher`

该结构体提供了默认哈希算法实现。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(res!: Int64 = 0)`](init.md) | 构造函数，创建一个 DefaultHasher。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`finish(): Int64`](finish.md) | 获取哈希运算的结果。 |
| [`mut reset(): Unit`](reset.md) | 重置哈希值为 0。 |
| [`mut write(value: Bool): Unit`](write/index.md) | 通过该函数把想要哈希运算的 Bool 值传入，然后进行哈希组合运算。 |
| [`mut write(value: Float16): Unit`](write/index.md) | 通过该函数把想要哈希运算的 Float16 值传入，然后进行哈希组合运算。 |
| [`mut write(value: Float32): Unit`](write/index.md) | 通过该函数把想要哈希运算的 Float32 值传入，然后进行哈希组合运算。 |
| [`mut write(value: Float64): Unit`](write/index.md) | 通过该函数把想要哈希运算的 Float64 值传入，然后进行哈希组合运算。 |
| [`mut write(value: Int16): Unit`](write/index.md) | 通过该函数把想要哈希运算的 Int16 值传入，然后进行哈希组合运算。 |
| [`mut write(value: Int32): Unit`](write/index.md) | 通过该函数把想要哈希运算的 Int32 值传入，然后进行哈希组合运算。 |
| [`mut write(value: Int64): Unit`](write/index.md) | 通过该函数把想要哈希运算的 Int64 值传入，然后进行哈希组合运算。 |
| [`mut write(value: Int8): Unit`](write/index.md) | 通过该函数把想要哈希运算的 Int8 值传入，然后进行哈希组合运算。 |
| [`mut write(value: Rune): Unit`](write/index.md) | 通过该函数把想要哈希运算的 Rune 值传入，然后进行哈希组合运算。 |
| [`mut write(value: String): Unit`](write/index.md) | 通过该函数把想要哈希运算的 String 值传入，然后进行哈希组合运算。 |
| [`mut write(value: UInt16): Unit`](write/index.md) | 通过该函数把想要哈希运算的 UInt16 值传入，然后进行哈希组合运算。 |
| [`mut write(value: UInt32): Unit`](write/index.md) | 通过该函数把想要哈希运算的 UInt32 值传入，然后进行哈希组合运算。 |
| [`mut write(value: UInt64): Unit`](write/index.md) | 通过该函数把想要哈希运算的 UInt64 值传入，然后进行哈希组合运算。 |
| [`mut write(value: UInt8): Unit`](write/index.md) | 通过该函数把想要哈希运算的 UInt8 值传入，然后进行哈希组合运算。 |
