<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.kit.class.defaultcryptokit.privatekeyfromder" parent="stdx.crypto.kit.class.defaultcryptokit" -->
# DefaultCryptoKit.privateKeyFromDer

[← DefaultCryptoKit](index.md)

本页汇总 2 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
func privateKeyFromDer(encoded: DerBlob): PrivateKey
```

将私钥从 DER 格式解码。

## 参数

- encoded: DerBlob - 待解码的 DerBlob 对象。

## 返回值

- PrivateKey - 解码得到的私钥。

## 异常

- CryptoException - 编码文件中无有效信息时抛出异常。
- X509Exception - 解码失败时抛出异常。

## 重载 2

### 签名

```cangjie role=signature
func privateKeyFromDer(encoded: DerBlob, password!: ?String): PrivateKey
```

将私钥从 DER 格式解密解码。密码为 None 时则不解密。

## 参数

- encoded: DerBlob - 待解密解码的 DerBlob 对象。
- password!: ?String - 解密密码。

## 返回值

- PrivateKey - 解密解码得到的私钥。

## 异常

- CryptoException - 编码文件中无有效信息时抛出异常。
- X509Exception - 解码失败时抛出异常。

