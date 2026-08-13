<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.server.updatecert" parent="stdx.net.http.class.server" -->
# Server.updateCert

[← Server](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func updateCert(Array<X509Certificate>, PrivateKey)

### 签名

```cangjie role=signature
public func updateCert(certChain: Array<X509Certificate>, certKey: PrivateKey): Unit
```

对 TLS 证书进行热更新。

### 契约

参数：

- certChain: Array\<X509Certificate> - 证书链。
- certKey: PrivateKey - 证书匹配的私钥。

异常：

- HttpException - 服务端未配置 tlsConfig 时抛出异常。

## func updateCert(String, String)

### 签名

```cangjie role=signature
public func updateCert(certificateChainFile: String, privateKeyFile: String): Unit
```

对 TLS 证书进行热更新。

### 契约

参数：

- certificateChainFile: String - 证书链文件。
- privateKeyFile: String - 证书匹配的私钥文件。

异常：

- IllegalArgumentException - 参数包含空字符时抛出异常。
- HttpException - 服务端未配置 tlsConfig 时抛出异常。
