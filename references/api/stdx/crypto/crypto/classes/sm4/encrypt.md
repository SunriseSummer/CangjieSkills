<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.crypto.class.sm4.encrypt" parent="stdx.crypto.crypto.class.sm4" -->
# SM4.encrypt

[← SM4](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## func encrypt(Array<Byte>)

### 签名

```cangjie role=signature
public func encrypt(input: Array<Byte>): Array<Byte>
```

加密一段数据数据。

### 契约

参数：

- input: Array\<Byte> - 输入字节序列。

返回值：

- Array\<Byte> - 加密后的结果。

异常：

- CryptoException - 加密失败，抛出异常。

## func encrypt(Array<Byte>, Array<Byte>)

### 签名

```cangjie role=signature
public func encrypt(input: Array<Byte>, to!: Array<Byte>): Int64
```

加密一段数据数据，指定输出数组长度会影响加解密结果。

### 契约

功能：加密一段数据数据，指定输出数组长度会影响加解密结果。一般而言选填充模式，指定的密文数组长度不能小于明文数组长度加上一个 blockSize。

参数：

- input: Array\<Byte> - 待进行加密的数据。
- to!: Array\<Byte> - 输出数组。

返回值：

- Int64 - 输出长度。

异常：

- CryptoException - 加密失败，抛出异常。
- IllegalArgumentException - 当 to 的 size = 0 时，抛出异常。

## func encrypt(InputStream, OutputStream)

### 签名

```cangjie role=signature
public func encrypt(input: InputStream, output: OutputStream): Unit
```

对输入流进行加密，一般如果数据过大无法一次对其加密，可以对数据流进行加密。

### 契约

参数：

- input:InputStream  - 待加密的输入数据流。
- output: OutputStream - 解密后的输出数据流。

异常：

- CryptoException - 加密失败，抛出异常。
