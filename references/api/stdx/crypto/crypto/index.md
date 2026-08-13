<!-- cj-doc kind="api-package" level="4" id="stdx.crypto.crypto" parent="api.stdx" -->
# stdx.crypto.crypto

[← stdx 包索引](../../index.md)

提供安全随机数及 SM4 对称加解密。

包路径：`stdx.crypto.crypto`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`SecureRandom`](classes/securerandom/index.md) | 用于生成加密安全的伪随机数。 |
| [`SM4 <: BlockCipher`](classes/sm4/index.md) | 提供国密 SM4 对称加解密。 |
| [`SecureRandomException <: Exception`](classes/securerandomexception/index.md) | crypto 包安全随机数的异常类。 |

## 结构体

| 声明 | 功能 |
|---|---|
| [`OperationMode <: ToString & Equatable<OperationMode>`](structs/operationmode/index.md) | 对称加解密算法的工作模式。 |
| [`PaddingMode <: Equatable<PaddingMode>`](structs/paddingmode/index.md) | 对称加解密算法的填充模式。 |
