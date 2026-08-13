<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.crypto.class.sm4.decrypt" parent="stdx.crypto.crypto.class.sm4" -->
# SM4.decrypt

[← SM4](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## func decrypt(Array<Byte>)

### 签名

```cangjie role=signature
public func decrypt(input: Array<Byte>): Array<Byte>
```

解密一段数据数据。

### 契约

参数：

- input: Array\<Byte> - 输入字节序列。

返回值：

- Array\<Byte> - 解密后的结果。

异常：

- CryptoException - 解密失败，抛出异常。

## func decrypt(Array<Byte>, Array<Byte>)

### 签名

```cangjie role=signature
public func decrypt(input: Array<Byte>,  to!: Array<Byte>): Int64
```

解密一段数据数据，指定输出数组长度会影响加解密结果。

### 契约

功能：解密一段数据数据，指定输出数组长度会影响加解密结果。一般而言，指定的明文数组长度不能小于密文数组长度减去一个 blockSize。

参数：

- input: Array\<Byte> - 待进行解密的数据。
- to!: Array\<Byte> - 输出数组。

返回值：

- Int64 - 输出长度。

异常：

- CryptoException - 解密失败，抛出异常。
- IllegalArgumentException - 当 to 的 size = 0 时，抛出异常。

## func decrypt(InputStream, OutputStream)

### 签名

```cangjie role=signature
public func decrypt(input: InputStream, output: OutputStream): Unit
```

对输入流进行解密，一般如果数据过大无法一次对其解密，可以对数据流进行解密。

### 契约

参数：

- input:InputStream  - 待解密的输入数据流。
- output: OutputStream - 解密后的输出数据流。

异常：

- CryptoException - 解密失败，抛出异常。
