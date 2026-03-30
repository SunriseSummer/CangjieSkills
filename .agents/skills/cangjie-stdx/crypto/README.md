# 仓颉语言加密与证书 Skill（stdx.crypto）

## 1. 概述

`stdx.crypto` 包族提供完整的密码学安全能力，涵盖安全随机数、消息摘要、对称加密、非对称加密与签名、数字证书处理等。所有加密包底层基于 **OpenSSL 3**，需要确保系统已安装 OpenSSL 3 动态库（Linux：`sudo apt install libssl-dev`）。

| 包名 | 功能 |
|------|------|
| `stdx.crypto.crypto` | 安全随机数（SecureRandom）、SM4 对称加密 |
| `stdx.crypto.digest` | 消息摘要算法（MD5/SHA/SM3/HMAC） |
| `stdx.crypto.keys` | 非对称加密与签名（RSA/SM2/ECDSA） |
| `stdx.crypto.x509` | X509 数字证书解析、验证与创建 |

---

## 2. SecureRandom — 安全随机数

`SecureRandom` 是密码学安全的伪随机数生成器（CSPRNG），适用于密钥生成、随机盐（salt/nonce）等安全场景。与 `std.random.Random` 不同，`SecureRandom` 基于操作系统的熵源（如 `/dev/urandom`），能够产生不可预测的随机序列。

可以通过 `priv` 参数选择是否使用私有随机源：`priv: true` 使用更安全的私有随机源（如 Linux 的 `/dev/random`），可能在熵不足时阻塞；默认 `priv: false` 使用系统标准随机源，不会阻塞。

| 方法 | 说明 |
|------|------|
| `SecureRandom()` | 创建安全随机数生成器（标准随机源） |
| `SecureRandom(priv!: Bool)` | `priv: true` 使用私有随机源 |
| `nextBool(): Bool` | 随机布尔值 |
| `nextUInt8(): UInt8` | 随机字节 |
| `nextInt64(): Int64` | 随机 Int64 |
| `nextFloat64(): Float64` | `[0.0, 1.0)` 范围随机浮点 |

以下示例演示如何使用 `SecureRandom` 生成各种类型的安全随机数：

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

消息摘要（Hash）是将任意长度的数据映射为固定长度摘要值的单向函数，常用于数据完整性校验、密码存储和数字签名。仓颉的 `stdx.crypto.digest` 包提供多种摘要算法实现，所有算法都实现统一的 `Digest` 接口。

通用使用流程：

1. 创建摘要实例（如 `SHA256()`）
2. 调用 `write(data)` 输入数据（可多次调用）
3. 调用 `finish()` 获取最终摘要值
4. 如需重复使用，调用 `reset()` 重置状态

**HMAC**（Hash-based Message Authentication Code）是基于密钥和哈希函数的消息认证码，不仅能验证数据完整性，还能验证消息来源的真实性，适用于 API 签名、Token 验证等场景。

| 算法类 | 摘要长度 | 说明 |
|--------|----------|------|
| `MD5` | 128 位 | ⚠️ 不推荐用于安全场景（已被破解） |
| `SHA1` | 160 位 | ⚠️ 安全性较弱，逐步淘汰 |
| `SHA224` | 224 位 | |
| `SHA256` | 256 位 | 推荐 |
| `SHA384` | 384 位 | |
| `SHA512` | 512 位 | |
| `SM3` | 256 位 | 国密标准 |
| `HMAC` | 依赖底层算法 | 基于密钥的消息认证码 |

下面演示 SHA256 摘要计算和 HMAC-SHA256 消息认证码的使用：

```cangjie
package test_proj
import stdx.crypto.digest.*
import stdx.encoding.hex.*

main() {
    // SHA256 摘要
    let sha256 = SHA256()
    sha256.write("hello world".toArray())
    let digest = sha256.finish()
    println("SHA256: ${toHexString(digest)}")

    // HMAC-SHA256
    let hmac = HMAC("secret-key".toArray(), HashType.SHA256)
    hmac.write("message".toArray())
    let mac = hmac.finish()
    println("HMAC: ${toHexString(mac)}")
}
```

---

## 4. RSA 非对称加密与签名（stdx.crypto.keys）

RSA 是最广泛使用的非对称加密算法，基于大整数因子分解的数学难题。非对称加密使用一对密钥——公钥和私钥：公钥可以公开分发用于加密或验签，私钥由持有者秘密保管用于解密或签名。

仓颉中使用 `RSAPrivateKey(bits)` 生成指定位长的私钥，再通过 `RSAPublicKey(pri)` 导出对应的公钥。密钥位长推荐 2048 位以上。

### 4.1 密钥生成

| 类 | 构造 | 说明 |
|----|------|------|
| `RSAPrivateKey` | `RSAPrivateKey(bits: Int64)` | 生成指定位数的 RSA 私钥 |
| `RSAPublicKey` | `RSAPublicKey(pri: RSAPrivateKey)` | 从私钥导出公钥 |

### 4.2 加密/解密

加密使用公钥（任何人可加密），解密使用私钥（仅持有者可解密）。仓颉中 RSA 加密/解密通过 `ByteBuffer` 进行数据传输，支持 `OAEP`（推荐）和 `PKCS1` 两种填充模式。

- **OAEP**（Optimal Asymmetric Encryption Padding）：更安全的填充方案，推荐使用。需要指定两个哈希算法参数——`OAEPOption(mgfHash, oaepHash)`。
- **PKCS1**：传统填充方案，兼容性好但安全性略低。

下面演示 RSA-OAEP 加密和解密流程：

```cangjie
package test_proj
import stdx.crypto.keys.*
import stdx.crypto.digest.*
import std.io.*

main() {
    // 生成 2048 位 RSA 密钥对
    let rsaPri = RSAPrivateKey(2048)
    let rsaPub = RSAPublicKey(rsaPri)

    // 加密
    let plaintext = "hello cangjie"
    let input = ByteBuffer()
    let encrypted = ByteBuffer()
    let decrypted = ByteBuffer()
    input.write(plaintext.toArray())

    let encOpt = OAEPOption(SHA1(), SHA256())
    rsaPub.encrypt(input, encrypted, padType: OAEP(encOpt))

    // 解密
    let decOpt = OAEPOption(SHA1(), SHA256())
    rsaPri.decrypt(encrypted, decrypted, padType: OAEP(decOpt))

    let buf = Array<Byte>(plaintext.size, repeat: 0)
    decrypted.read(buf)
    println(String.fromUtf8(buf))  // hello cangjie
}
```

### 4.3 签名/验签

数字签名用于验证数据完整性和来源真实性。签名使用私钥（仅持有者可签名），验签使用公钥（任何人可验证）。流程为：先对消息计算摘要，再用私钥对摘要签名。

RSA 签名需要传入摘要算法实例、摘要值和填充模式。签名填充推荐使用 `PKCS1`（传统方式）或 `PSS`（更安全的概率性方案）。

```cangjie
package test_proj
import stdx.crypto.keys.*
import stdx.crypto.digest.*

main() {
    let rsaPri = RSAPrivateKey(2048)
    let rsaPub = RSAPublicKey(rsaPri)

    // 计算消息摘要
    let sha256 = SHA256()
    sha256.write("important message".toArray())
    let digest = sha256.finish()

    // 签名
    let signature = rsaPri.sign(sha256, digest, padType: PKCS1)

    // 验签
    sha256.reset()
    sha256.write("important message".toArray())
    let digest2 = sha256.finish()
    if (rsaPub.verify(sha256, digest2, signature, padType: PKCS1)) {
        println("signature verified")
    }
}
```

### 4.4 PEM 编解码

PEM（Privacy Enhanced Mail）是一种用 Base64 编码的密钥/证书存储格式，以 `-----BEGIN XXX-----` 和 `-----END XXX-----` 标记包裹。它是密钥交换和持久化的标准格式。

`encodeToPem()` 返回 `PemEntry` 类型（而非 `String`），需要通过 `toString()` 转换为字符串形式。`decodeFromPem()` 接受 PEM 格式字符串，还原为密钥对象。

```cangjie
package test_proj
import stdx.crypto.keys.*

main() {
    let rsaPri = RSAPrivateKey(2048)
    let rsaPub = RSAPublicKey(rsaPri)

    // 导出为 PEM 格式（返回 PemEntry）
    let priPem = rsaPri.encodeToPem()
    let pubPem = rsaPub.encodeToPem()
    println("private key PEM exported")
    println("public key PEM exported")

    // 从 PEM 字符串导入
    let pri2 = RSAPrivateKey.decodeFromPem(priPem.toString())
    let pub2 = RSAPublicKey.decodeFromPem(pubPem.toString())
    println("key imported successfully")
}
```

---

## 5. ECDSA 椭圆曲线签名

ECDSA（Elliptic Curve Digital Signature Algorithm）是基于椭圆曲线数学的数字签名算法。相比 RSA，ECDSA 在相同安全强度下使用更短的密钥长度（256 位 ECDSA ≈ 3072 位 RSA），计算效率更高，适合移动端和 IoT 等资源受限场景。

仓颉支持的椭圆曲线包括 `P224`、`P256`（推荐）、`P384`、`P521`。与 RSA 签名不同，ECDSA 的 `sign()` 方法只需传入摘要字节数组，不需要额外的哈希算法参数或填充模式。

```cangjie
package test_proj
import stdx.crypto.keys.*
import stdx.crypto.digest.*

main() {
    // 支持的曲线: P224, P256, P384, P521
    let ecPri = ECDSAPrivateKey(P256)
    let ecPub = ECDSAPublicKey(ecPri)

    let sha256 = SHA256()
    sha256.write("test data".toArray())
    let digest = sha256.finish()

    // ECDSA 签名只需传入摘要
    let sig = ecPri.sign(digest)
    if (ecPub.verify(digest, sig)) {
        println("ECDSA verify success")
    }
}
```

---

## 6. X509 数字证书

X509 是数字证书的国际标准格式，用于在公钥基础设施（PKI）中绑定公钥与身份信息。TLS/HTTPS 通信中服务端的身份验证就是基于 X509 证书链实现的。

`stdx.crypto.x509` 包支持证书解析（从 PEM 或 DER 格式）、证书信息读取（主体、颁发者、有效期等）、证书签名验证。也支持通过 `X509CertificateRequest` 和 `X509CertificateInfo` 创建自签名证书和证书链。

| 方法 | 说明 |
|------|------|
| `X509Certificate.decodeFromPem(String)` | 从 PEM 字符串解析证书（返回数组） |
| `X509Certificate.decodeFromDer(Array<Byte>)` | 从 DER 二进制解析证书 |
| `cert.encodeToPem(): String` | 导出为 PEM 格式 |
| `cert.verify(issuerCert)` | 验证证书签名 |
| `cert.subject / cert.issuer` | 证书主体/颁发者信息（`X509Name` 类型） |
| `cert.notBefore / cert.notAfter` | 证书有效期（`DateTime` 类型） |
| `cert.serialNumber` | 证书序列号 |

---

## 7. 关键规则速查

1. 所有 `stdx.crypto` 包依赖 OpenSSL 3 动态库，使用前确保系统已安装
2. `SecureRandom` 用于安全场景（密钥生成、盐值等），`std.random.Random` 用于非安全的通用场景
3. RSA 密钥推荐 2048 位以上，ECDSA 推荐使用 `P256` 曲线
4. 加密填充用 `OAEP`（更安全），签名填充用 `PKCS1` 或 `PSS`
5. `Digest.finish()` 获取摘要后需要 `reset()` 才能重复使用同一实例
6. 密钥 PEM 编解码：`encodeToPem()` 返回 `PemEntry`（非 String），`decodeFromPem()` 接受 String
7. ECDSA 签名接口更简洁——`sign(digest)` / `verify(digest, sig)`，不需要哈希参数
