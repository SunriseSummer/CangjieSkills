<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.crypto.struct.operationmode" parent="stdx.crypto.crypto" -->
# OperationMode

[← stdx.crypto.crypto](../../index.md)

`OperationMode <: ToString & Equatable<OperationMode>`

对称加解密算法的工作模式。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`ECB: OperationMode`](field-ecb.md) | Electronic CodeBook（单子密码本）工作模式， ECB 初始值是 OperationMode("ECB")。 |
| [`CBC: OperationMode`](field-cbc.md) | Cipher Block Chaining（密码分组链接）工作模式，CBC 初始值是 OperationMode("CBC")。 |
| [`OFB: OperationMode`](field-ofb.md) | Output FeedBack（输出反馈）工作模式，OFB 初始值是 OperationMode("OFB")。 |
| [`CFB: OperationMode`](field-cfb.md) | Cipher FeedBack（密文反馈）工作模式，CFB 初始值是 OperationMode("CFB")。 |
| [`CTR: OperationMode`](field-ctr.md) | CounTeR（计数器）工作模式，CTR 初始值是 OperationMode("CTR")。 |
| [`GCM: OperationMode`](field-gcm.md) | Galois Counter（伽罗瓦计数器）工作模式，GCM 初始值是 OperationMode("GCM")。 |
| [`mode: String`](field-mode.md) | operation 分组加解密的工作模式，目前支持 ECB、CBC CFB OFB CTR GCM。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`override toString(): String`](tostring.md) | 获取工作模式字符串。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`override operator ==(other: OperationMode): Bool`](operator-eq.md) | 工作模式比较是否相同。 |
| [`override operator !=(other: OperationMode): Bool`](operator-ne.md) | 工作模式比较是否不相同。 |
