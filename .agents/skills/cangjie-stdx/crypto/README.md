# 仓颉语言加密与证书 Skill（stdx.crypto）

## 1. 概述

`stdx.crypto` 包族提供加密、签名、摘要、证书等安全能力：

| 包名 | 功能 |
|------|------|
| `stdx.crypto.crypto` | 安全随机数（SecureRandom）、SM4 对称加密 |
| `stdx.crypto.digest` | 消息摘要算法（MD5/SHA/SM3/HMAC） |
| `stdx.crypto.keys` | 非对称加密与签名（RSA/SM2/ECDSA） |
| `stdx.crypto.x509` | X509 数字证书处理 |

> 所有加密包都依赖 **OpenSSL 3** 动态库。Linux 安装：`sudo apt install libssl-dev`

---

## 2. SecureRandom — 安全随机数

`stdx.crypto.crypto` 包提供密码学安全的随机数生成器。

| 方法 | 说明 |
|------|------|
| `SecureRandom()` | 创建安全随机数生成器 |
| `SecureRandom(priv!: Bool)` | `priv: true` 使用私有随机源 |
| `nextBool(): Bool` | 随机布尔值 |
| `nextUInt8(): UInt8` | 随机字节 |
| `nextInt64(): Int64` | 随机 Int64 |
| `nextFloat64(): Float64` | 随机 Float64 |

```cangjie
package test_proj
import stdx.crypto.crypto.*

main() {
    let r = SecureRandom()
    println("bool: ${r.nextBool()}")
    println("int64: ${r.nextInt64()}")
    println("float64: ${r.nextFloat64()}")
    println("uint8: ${r.nextUInt8()}")
}
```

---

## 3. 消息摘要（stdx.crypto.digest）

提供常用哈希算法，所有算法共享相同的 `Digest` 接口。

| 算法类 | 摘要长度 | 说明 |
|--------|----------|------|
| `MD5` | 128 位 | 不推荐用于安全场景 |
| `SHA1` | 160 位 | |
| `SHA224` | 224 位 | |
| `SHA256` | 256 位 | 推荐 |
| `SHA384` | 384 位 | |
| `SHA512` | 512 位 | |
| `SM3` | 256 位 | 国密标准 |
| `HMAC` | 依赖算法 | 基于哈希的消息认证码 |

通用方法：`write(Array<Byte>)` 输入数据 → `finish(): Array<Byte>` 获取摘要 → `reset()` 重置状态。

```cangjie
package test_proj
import stdx.crypto.digest.*
import stdx.encoding.hex.*

main() {
    // SHA256 摘要
    var sha256 = SHA256()
    sha256.write("hello world".toArray())
    var digest = sha256.finish()
    println("SHA256: ${toHexString(digest)}")

    // HMAC-SHA256
    var hmac = HMAC("secret-key".toArray(), HashType.SHA256)
    hmac.write("message".toArray())
    var mac = hmac.finish()
    println("HMAC: ${toHexString(mac)}")
}
```

---

## 4. RSA 非对称加密与签名（stdx.crypto.keys）

### 4.1 密钥生成

| 类 | 构造 | 说明 |
|----|------|------|
| `RSAPrivateKey` | `RSAPrivateKey(bits: Int64)` | 生成指定位数的 RSA 私钥 |
| `RSAPublicKey` | `RSAPublicKey(pri: RSAPrivateKey)` | 从私钥导出公钥 |

### 4.2 加密/解密

```cangjie
package test_proj
import stdx.crypto.keys.*
import stdx.crypto.digest.*
import std.io.*
import std.crypto.digest.*

main() {
    // 生成 2048 位 RSA 密钥对
    var rsaPri = RSAPrivateKey(2048)
    var rsaPub = RSAPublicKey(rsaPri)

    // 加密
    var plaintext = "hello cangjie"
    var input = ByteBuffer()
    var encrypted = ByteBuffer()
    var decrypted = ByteBuffer()
    input.write(plaintext.toArray())

    var encOpt = OAEPOption(SHA1(), SHA256())
    rsaPub.encrypt(input, encrypted, padType: OAEP(encOpt))

    // 解密
    var decOpt = OAEPOption(SHA1(), SHA256())
    rsaPri.decrypt(encrypted, decrypted, padType: OAEP(decOpt))

    var buf = Array<Byte>(plaintext.size, repeat: 0)
    decrypted.read(buf)
    println(String.fromUtf8(buf))  // hello cangjie
}
```

### 4.3 签名/验签

```cangjie
package test_proj
import stdx.crypto.keys.*
import stdx.crypto.digest.*
import std.crypto.digest.*

main() {
    var rsaPri = RSAPrivateKey(2048)
    var rsaPub = RSAPublicKey(rsaPri)

    // 计算消息摘要
    var sha256 = SHA256()
    sha256.write("important message".toArray())
    var digest = sha256.finish()

    // 签名
    var signature = rsaPri.sign(sha256, digest, padType: PKCS1)

    // 验签
    sha256.reset()
    sha256.write("important message".toArray())
    var digest2 = sha256.finish()
    if (rsaPub.verify(sha256, digest2, signature, padType: PKCS1)) {
        println("signature verified")
    }
}
```

### 4.4 PEM 编解码

```cangjie
package test_proj
import stdx.crypto.keys.*

main() {
    var rsaPri = RSAPrivateKey(2048)
    var rsaPub = RSAPublicKey(rsaPri)

    // 导出为 PEM 格式（返回 PemEntry）
    var priPem = rsaPri.encodeToPem()
    var pubPem = rsaPub.encodeToPem()
    println("private key PEM exported")
    println("public key PEM exported")

    // 从 PEM 字符串导入
    var pri2 = RSAPrivateKey.decodeFromPem(priPem.toString())
    var pub2 = RSAPublicKey.decodeFromPem(pubPem.toString())
    println("key imported successfully")
}
```

---

## 5. ECDSA 椭圆曲线签名

```cangjie
package test_proj
import stdx.crypto.keys.*
import stdx.crypto.digest.*

main() {
    // 支持的曲线: P224, P256, P384, P521
    var ecPri = ECDSAPrivateKey(P256)
    var ecPub = ECDSAPublicKey(ecPri)

    var sha256 = SHA256()
    sha256.write("test data".toArray())
    var digest = sha256.finish()

    // ECDSA 签名只需传入摘要
    var sig = ecPri.sign(digest)
    if (ecPub.verify(digest, sig)) {
        println("ECDSA verify success")
    }
}
```

---

## 6. X509 数字证书

`stdx.crypto.x509` 包提供证书解析、验证和创建能力。

| 方法 | 说明 |
|------|------|
| `X509Certificate.decodeFromPem(String)` | 从 PEM 字符串解析证书（返回数组） |
| `X509Certificate.decodeFromDer(Array<Byte>)` | 从 DER 二进制解析证书 |
| `cert.encodeToPem(): String` | 导出为 PEM 格式 |
| `cert.verify(issuerCert)` | 验证证书签名 |
| `cert.subject / cert.issuer` | 证书主体/颁发者信息 |
| `cert.notBefore / cert.notAfter` | 证书有效期 |
| `cert.serialNumber` | 序列号 |

> 自签名证书和证书链创建需要使用 `X509CertificateRequest` 和 `X509CertificateInfo` 等高级 API，详见原始文档。

---

## 7. 关键规则速查

1. 所有 `stdx.crypto` 包依赖 OpenSSL 3 动态库
2. `SecureRandom` 用于安全场景，`std.random.Random` 用于非安全场景
3. RSA 密钥推荐 2048 位以上
4. 加密用 `OAEP` 填充，签名用 `PKCS1` 或 `PSS` 填充
5. `Digest.finish()` 后需要 `reset()` 才能重新使用
6. 密钥支持 PEM 格式的 `encodeToPem(): PemEntry`/`decodeFromPem(String)` 互转
7. ECDSA 推荐使用 `P256` 曲线
