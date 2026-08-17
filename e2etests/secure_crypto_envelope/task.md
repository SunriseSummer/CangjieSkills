# RSA 安全加密信封

## 目标

在仓颉 `1.1.3 (cjnative)` 中实现包 `secure_crypto_envelope`：用 RSA-OAEP 加密短负载，用 RSA/SHA-256/PKCS#1 对密文签名，并支持 RSA PEM 导入导出与加密安全随机数。实现必须直接使用 `stdx.crypto.crypto.SecureRandom`、`stdx.crypto.keys`、`stdx.crypto.digest`、`std.crypto.digest`、`std.io` 和 `stdx.encoding.hex`。

将 `secure_crypto_envelope_test.cj` 原样复制到项目 `src/`，并把 `fixtures/` 原样放在项目根目录；测试与 fixture 不可修改。stdx 固定为 `1.1.3.1`。

## 公开 API

```cangjie
public class EnvelopeException <: Exception { public init(message: String) }

public class RsaSigningKeyPair {
    public let privateKey: RSAPrivateKey
    public let publicKey: RSAPublicKey
    public init(privateKey: RSAPrivateKey, publicKey: RSAPublicKey)
}

public class SignedEnvelope {
    public let ciphertext: Array<Byte>
    public let signature: Array<Byte>
    public init(ciphertext: Array<Byte>, signature: Array<Byte>)
}

public class CryptoEnvelope {
    public static func secureBytes(length: Int32): Array<Byte>
    public static func sha256Hex(data: Array<Byte>): String
    public static func generateSigningKeyPair(bits!: Int32 = 2048): RsaSigningKeyPair
    public static func privateKeyToPem(key: RSAPrivateKey): String
    public static func publicKeyToPem(key: RSAPublicKey): String
    public static func privateKeyFromPem(text: String): RSAPrivateKey
    public static func publicKeyFromPem(text: String): RSAPublicKey
    public static func encrypt(plaintext: Array<Byte>, key: RSAPublicKey): Array<Byte>
    public static func decrypt(ciphertext: Array<Byte>, key: RSAPrivateKey): Array<Byte>
    public static func sign(data: Array<Byte>, key: RSAPrivateKey): Array<Byte>
    public static func verify(data: Array<Byte>, signature: Array<Byte>,
                              key: RSAPublicKey): Bool
    public static func seal(plaintext: Array<Byte>, encryptionKey: RSAPublicKey,
                            signingKey: RSAPrivateKey): SignedEnvelope
    public static func open(envelope: SignedEnvelope, decryptionKey: RSAPrivateKey,
                            verificationKey: RSAPublicKey): Array<Byte>
}
```

## 契约

- `secureBytes` 调用 `SecureRandom(priv: true).nextBytes(length)`；非法长度保留底层参数异常。
- RSA 默认 2048 位，公钥从私钥派生。PEM 使用 `encodeToPem().encode()` 与对应 `decodeFromPem`。
- `encrypt`/`decrypt` 使用 `ByteBuffer` 输入输出和 `OAEP(OAEPOption(SHA1(), SHA256()))`；OAEP 具有随机性，不得假定相同明文产生相同密文。
- `sign`/`verify` 先计算 SHA-256 摘要，再使用 RSA `PKCS1`。
- `seal` 签名的内容严格为密文字节；`open` 必须先验签、再解密，验签失败抛 `EnvelopeException`。
- 输入数组不得被修改。本任务只处理 OAEP 可承载的短消息，测试最大 128 字节。

## 工程与入口

包名 `secure_crypto_envelope`，输出类型 `executable`，使用当前 Skill 的 `setup_stdx.py` 配置 stdx。`main()` 从冻结 fixture 导入密钥，加密、签名并恢复 `Hello Cangjie`，输出：

```text
verified=true
plaintext=Hello Cangjie
digest=cf63ffdb3df8a9c5ad251380f560a7162b68c6ef4933e767052369e574594540
```

## 验收

`cjpm clean`、`cjpm build`、`cjpm test`、`cjpm run` 均成功；至少 20 项测试全通过，编译器 warning 为 0。
