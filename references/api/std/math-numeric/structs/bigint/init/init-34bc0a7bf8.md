<!-- cj-doc kind="api-member" level="7" id="std.math.numeric.struct.bigint.init.init-34bc0a7bf8" parent="std.math.numeric.struct.bigint.init" -->
# BigInt.init(Array<Byte>)

[← BigInt.init](index.md)

## 签名

```cangjie role=signature
public init(bytes: Array<Byte>)
```

通过大端的 Byte 数组以补码形式构建一个 BigInt 结构体。

## 契约

> **说明：**
>
> 数据存储方法有以下两种：
>
> - 大端存储方式：高位字节存放在低位地址。
> - 小端存储方式：将数据的低位字节存放在内存的高位地址。

参数：

- bytes: Array\<Byte> - 大端二进制补码数组，数组长度不能为空。

异常：

- IllegalArgumentException - 当传入空数组时，抛此异常。
