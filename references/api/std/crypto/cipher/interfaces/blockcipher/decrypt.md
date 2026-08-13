<!-- cj-doc kind="api-member" level="6" id="std.crypto.cipher.interface.blockcipher.decrypt" parent="std.crypto.cipher.interface.blockcipher" -->
# BlockCipher.decrypt

[← BlockCipher](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func decrypt(Array<Byte>)

### 签名

```cangjie role=signature
func decrypt(input: Array<Byte>): Array<Byte>
```

提供解密函数。

### 契约

参数：

- input: Array\<Byte> - 待解密的数据。

返回值：

- Array\<Byte> - 解密后的结果。

## func decrypt(Array<Byte>, Array<Byte>)

### 签名

```cangjie role=signature
func decrypt(input: Array<Byte>,  to!: Array<Byte>): Int64
```

提供解密函数。

### 契约

参数：

- input: Array\<Byte> - 待解密的数据。
- to!: Array\<Byte> - 输出数组。

返回值：

- Int64 - 输出长度。
