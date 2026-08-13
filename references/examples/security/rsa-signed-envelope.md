<!-- cj-doc kind="example-leaf" level="4" id="examples.security.rsa-signed-envelope" parent="examples.security" -->
# 用 RSA-OAEP 加密并签名密文

[← 密码、TLS 与证书](index.md)

RSA-OAEP 加密短消息，对密文的 SHA-256 摘要做 PKCS#1 签名；验签成功后再解密。

## 已验证示例

RSA-OAEP 只适合短负载；示例对密文而非明文签名，并在解密前验签。OAEP 的两个摘要参数分别控制主摘要和 MGF1；签名接口接收预先计算的 SHA-256 摘要。私钥若需要持久化，可用 `encodeToPem().encode()` 与 `decodeFromPem` 往返。

```cangjie cjtest=run id=guide.stdx.rsa-signed-envelope.run form=unit requires=stdx timeout=120s
package rsa_signed_envelope

import std.crypto.digest.*
import std.io.*
import stdx.crypto.digest.*
import stdx.crypto.keys.*

func encrypt(plaintext: Array<Byte>, key: RSAPublicKey): Array<Byte> {
    let output = ByteBuffer()
    key.encrypt(
        ByteBuffer(plaintext),
        output,
        padType: PadOption.OAEP(OAEPOption(SHA1(), SHA256())))
    return output.bytes()
}

func decrypt(ciphertext: Array<Byte>, key: RSAPrivateKey): Array<Byte> {
    let output = ByteBuffer()
    key.decrypt(
        ByteBuffer(ciphertext),
        output,
        padType: PadOption.OAEP(OAEPOption(SHA1(), SHA256())))
    return output.bytes()
}

func sign(ciphertext: Array<Byte>, key: RSAPrivateKey): Array<Byte> {
    let hash = digest<SHA256>(SHA256(), ciphertext)
    return key.sign(SHA256(), hash, padType: PadOption.PKCS1)
}

func verify(ciphertext: Array<Byte>, signature: Array<Byte>, key: RSAPublicKey): Bool {
    let hash = digest<SHA256>(SHA256(), ciphertext)
    return key.verify(SHA256(), hash, signature, padType: PadOption.PKCS1)
}

main(): Unit {
    let generated = RSAPrivateKey(2048)
    let privateKey = RSAPrivateKey.decodeFromPem(generated.encodeToPem().encode())
    let publicKey = RSAPublicKey(privateKey)
    let plaintext = "Hello Cangjie".toArray()
    let ciphertext = encrypt(plaintext, publicKey)
    let signature = sign(ciphertext, privateKey)
    let valid = verify(ciphertext, signature, publicKey)
    let restored = if (valid) {
        String.fromUtf8(decrypt(ciphertext, privateKey))
    } else {
        throw IllegalArgumentException("signature verification failed")
    }
    println("verified=${valid}")
    println("plaintext=${restored}")
}
```

预期标准输出：

```text cjtest=expect for=guide.stdx.rsa-signed-envelope.run stream=stdout match=exact
verified=true
plaintext=Hello Cangjie
```
