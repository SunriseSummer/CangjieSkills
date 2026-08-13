<!-- cj-doc kind="api-member" level="6" id="std.crypto.cipher.interface.blockcipher.encrypt" parent="std.crypto.cipher.interface.blockcipher" -->
# BlockCipher.encrypt

[← BlockCipher](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func encrypt(Array<Byte>)

### 签名

```cangjie role=signature
func encrypt(input: Array<Byte>): Array<Byte>
```

提供加密函数。

### 契约

参数：

- input: Array\<Byte> - 待加密的数据。

返回值：

- Array\<Byte> - 加密后的结果。

## func encrypt(Array<Byte>, Array<Byte>)

### 签名

```cangjie role=signature
func encrypt(input: Array<Byte>, to!: Array<Byte>): Int64
```

提供加密函数。

### 契约

参数：

- input: Array\<Byte> - 待加密的数据。
- to!: Array\<Byte> - 输出数组。

返回值：

- Int64 - 输出长度。
