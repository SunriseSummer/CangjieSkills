<!-- cj-doc kind="api-package" level="4" id="std.crypto.digest" parent="api.std" -->
# std.crypto.digest

[← std 包索引](../../index.md)

提供常用摘要算法的通用接口，包括 MD5、SHA1、SHA224、SHA256、SHA384、SHA512、HMAC、SM3 等。

包路径：`std.crypto.digest`。在代码中只导入实际使用的类型或函数。

## 接口

| 声明 | 功能 |
|---|---|
| [`Digest`](interfaces/digest/index.md) | 摘要算法接口，继承该接口的 class、interface、struct 也需要遵守该接口中函数的入参及返回值定义。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`digest(…) — 2 个重载`](functions/digest.md) | 提供 digest 泛型函数，实现用指定的摘要算法进行摘要运算。 |
