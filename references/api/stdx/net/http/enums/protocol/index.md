<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.enum.protocol" parent="stdx.net.http" -->
# Protocol

[← stdx.net.http](../../index.md)

`Protocol <: Equatable<Protocol> & ToString`

定义 HTTP 协议类型枚举。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`HTTP1_0`](value-http1_0.md) | 定义 1.0 版本 HTTP 协议。 |
| [`HTTP1_1`](value-http1_1.md) | 定义 1.1 版本 HTTP 协议。 |
| [`HTTP2_0`](value-http2_0.md) | 定义 2.0 版本 HTTP 协议。 |
| [`UnknownProtocol(String)`](value-unknownprotocol-string.md) | 定义未知 HTTP 协议。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`override toString(): String`](tostring.md) | 获取 Http 协议版本字符串。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`override operator !=(that: Protocol): Bool`](operator-ne.md) | 判断枚举值是否不相等。 |
| [`override operator ==(that: Protocol): Bool`](operator-eq.md) | 判断枚举值是否相等。 |
