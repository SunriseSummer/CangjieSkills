<!-- cj-doc kind="api-type" level="5" id="stdx.net.tls.common.enum.tlsversion" parent="stdx.net.tls.common" -->
# TlsVersion

[← stdx.net.tls.common](../../index.md)

`@Derive[ToString, Hashable, Equatable] public enum TlsVersion`

TLS 协议版本。

## 方法

| 签名 | 功能 |
|---|---|
| [`func hashCode(): Int64`](hashcode.md) | 返回当前 TlsVersion 的哈希值。 |
| [`override func toString(): String`](tostring.md) | 返回当前 TlsVersion 的字符串表示。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator func !=(that: TlsVersion): Bool`](operator-ne.md) | 比较两个 TlsVersion 是否不等。 |
| [`operator func ==(that: TlsVersion): Bool`](operator-eq.md) | 比较两个 TlsVersion 是否相同。 |

## 枚举值

| 签名 | 功能 |
|---|---|
| [`TLCP`](value-tlcp.md) | 表示 TLCP 版本。 |
| [`V1_2`](value-v1_2.md) | 表示 TLS 1.2 版本。 |
| [`V1_3`](value-v1_3.md) | 表示 TLS 1.3 版本。 |

