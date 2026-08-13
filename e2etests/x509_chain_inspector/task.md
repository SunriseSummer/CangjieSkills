# X.509 证书链检查器

## 目标

在仓颉 `1.0.5 (cjnative)` 中实现包 `x509_chain_inspector`：解析冻结的根证书、中间证书、叶证书和 CSR，提取名称/SAN/算法信息，完成 PEM/DER 往返，并用显式根、中间链、DNS 与固定时间验证叶证书。实现必须直接使用 `stdx.crypto.x509`。

将 `x509_chain_inspector_test.cj` 原样复制到项目 `src/`，并把 `fixtures/` 原样放在项目根目录；不可修改。fixture 已冻结，不依赖系统根证书，运行时禁止调用当前时间。

## 公开 API

```cangjie
public class CertificateSummary {
    public let subjectCommonName: String
    public let issuerCommonName: String
    public let dnsNames: Array<String>
    public let emailAddresses: Array<String>
    public let ipAddresses: Array<IP>
    public let publicKeyAlgorithm: String
    public let signatureAlgorithm: String
    public init(subjectCommonName: String, issuerCommonName: String,
                dnsNames: Array<String>, emailAddresses: Array<String>,
                ipAddresses: Array<IP>, publicKeyAlgorithm: String,
                signatureAlgorithm: String)
}

public class X509Inspector {
    public static func decodeCertificates(pem: String): Array<X509Certificate>
    public static func decodeRequest(pem: String): X509CertificateRequest
    public static func summarize(cert: X509Certificate): CertificateSummary
    public static func certificatePemRoundTrip(cert: X509Certificate): X509Certificate
    public static func certificateDerRoundTrip(cert: X509Certificate): X509Certificate
    public static func requestPemRoundTrip(csr: X509CertificateRequest): X509CertificateRequest
    public static func requestDerRoundTrip(csr: X509CertificateRequest): X509CertificateRequest
    public static func verifyChain(cert: X509Certificate,
                                   roots: Array<X509Certificate>,
                                   intermediates: Array<X509Certificate>,
                                   dnsName: String, at: DateTime): Bool
}
```

## 契约

- PEM 解码可接受单证书或顺序拼接的证书 bundle，保持输入顺序。
- `decodeRequest` 要求恰好一个 CSR；否则抛 `X509Exception`。
- 名称中的 `commonName` 缺失时摘要写空字符串；其余数组保持证书顺序。
- PEM 往返使用 `encodeToPem().encode()`；DER 往返使用 `encodeToDer()` 和对应静态解码函数。
- `verifyChain` 创建 `VerifyOption`，显式设置 `roots`、`intermediates`、`dnsName`、`time` 后调用 `verify`。不得依赖默认系统根或 `DateTime.now()`。
- fixture 叶证书 DNS 为 `service.example.test`、`api.example.test`，SAN email 为 `ops@example.test`，IP 为 `127.0.0.1`；链为 leaf ← intermediate ← root。固定验证时间使用 2027-01-01 UTC 对应的本地无时区 `DateTime.of` 值。

## 工程与入口

包名 `x509_chain_inspector`，输出类型 `executable`，使用当前 Skill 的 `setup_stdx.py` 配置 stdx。入口读取 fixture 并输出：

```text
leaf=service.example.test
issuer=CJ Test Intermediate
dns=2
chain=true
```

## 验收

`cjpm clean`、`cjpm build`、`cjpm test`、`cjpm run` 均成功；至少 20 项测试全通过，编译器 warning 为 0。
