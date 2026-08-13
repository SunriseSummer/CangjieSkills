<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.server.updateca" parent="stdx.net.http.class.server" -->
# Server.updateCA

[← Server](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func updateCA(Array<X509Certificate>)

### 签名

```cangjie role=signature
public func updateCA(newCa: Array<X509Certificate>): Unit
```

对 CA 证书进行热更新。

### 契约

参数：

- newCa: Array\<X509Certificate> - CA 证书。

异常：

- IllegalArgumentException - 参数包含空字符时抛出异常。
- HttpException - 服务端未配置 tlsConfig 时抛出异常。

## func updateCA(String)

### 签名

```cangjie role=signature
public func updateCA(newCaFile: String): Unit
```

对 CA 证书进行热更新。

### 契约

参数：

- newCaFile: String - CA 证书文件。

异常：

- IllegalArgumentException - 参数包含空字符时抛出异常。
- HttpException - 服务端未配置 tlsConfig 时抛出异常。
