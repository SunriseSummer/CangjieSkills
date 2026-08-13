<!-- cj-doc kind="api-type" level="5" id="std.net.interface.streamingsocket" parent="std.net" -->
# StreamingSocket

[← std.net](../../index.md)

`StreamingSocket <: IOStream & Resource & ToString`

双工流模式下的运行的 `Socket`，可被读写。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`localAddress: SocketAddress`](prop-localaddress.md) | 读取 `Socket` 将要或已经被绑定的本地地址。 |
| [`mut readTimeout: ?Duration`](prop-readtimeout.md) | 设置和读取读超时时间。 |
| [`remoteAddress: SocketAddress`](prop-remoteaddress.md) | 读取 `Socket` 将要或已经连接的远端地址。 |
| [`mut writeTimeout: ?Duration`](prop-writetimeout.md) | 设置和读取写超时时间。 |
