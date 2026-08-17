<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.crypto.class.sm4" parent="stdx.crypto.crypto" -->
# SM4

[← stdx.crypto.crypto](../../index.md)

`SM4 <: BlockCipher`

提供国密 SM4 对称加解密。

## 关键契约

平台观察：

- Windows x86_64 cjnative 1.1.3 + stdx 1.1.3.1 中，`SM4` 的 CBC 加密在独立入口和单元测试内均实测出现持续不返回。该组合下不要把 SM4 CBC 用于必须确定结束的任务；优先选择已验证的算法，或在目标平台上先做带超时的最小探针。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init( optMode: OperationMode, key: Array<Byte>, iv!: Array<Byte> = Array<Byte>(), paddingMode!: PaddingMode = PaddingMode.PKCS7Padding, aad!: Array<Byte> = Array<Byte>(), tagSize!: Int64 = 16 )`](init.md) | 创建 SM4 实例，可指定在不同工作模式下参数。 |

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`aad: Array<Byte>`](prop-aad.md) | 附加数据。 |
| [`algorithm: String`](prop-algorithm.md) | 获取分组加解密算法的算法名称。 |
| [`blockSize: Int64`](prop-blocksize.md) | 分组长度，单位字节。 |
| [`keySize: Int64`](prop-keysize.md) | 密钥长度。 |
| [`key: Array<Byte>`](prop-key.md) | 密钥。 |
| [`optMode: OperationMode`](prop-optmode.md) | 工作模式。 |
| [`paddingMode: PaddingMode`](prop-paddingmode.md) | 填充模式。 |
| [`iv: Array<Byte>`](prop-iv.md) | 初始化向量。 |
| [`ivSize: Int64`](prop-ivsize.md) | 初始化向量长度。 |
| [`tagSize: Int64`](prop-tagsize.md) | 摘要长度。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`encrypt(input: Array<Byte>): Array<Byte>`](encrypt.md) | 加密一段数据数据。 |
| [`encrypt(input: Array<Byte>, to!: Array<Byte>): Int64`](encrypt.md) | 加密一段数据数据，指定输出数组长度会影响加解密结果。 |
| [`encrypt(input: InputStream, output: OutputStream): Unit`](encrypt.md) | 对输入流进行加密，一般如果数据过大无法一次对其加密，可以对数据流进行加密。 |
| [`decrypt(input: Array<Byte>): Array<Byte>`](decrypt.md) | 解密一段数据数据。 |
| [`decrypt(input: Array<Byte>, to!: Array<Byte>): Int64`](decrypt.md) | 解密一段数据数据，指定输出数组长度会影响加解密结果。 |
| [`decrypt(input: InputStream, output: OutputStream): Unit`](decrypt.md) | 对输入流进行解密，一般如果数据过大无法一次对其解密，可以对数据流进行解密。 |
