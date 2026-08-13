<!-- cj-doc kind="api-type" level="5" id="stdx.net.tls.class.tlssocket" parent="stdx.net.tls" -->
# TlsSocket

[← stdx.net.tls](../../index.md)

`TlsSocket <: StreamingSocket & ToString &Equatable<TlsSocket> & Hashable`

TlsSocket 用于在客户端及服务端间创建加密传输通道。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`alpnProtocolName: ?String`](prop-alpnprotocolname.md) | 读取协商到的应用层协议名称。 |
| [`cipherSuite: CipherSuite`](prop-ciphersuite.md) | 握手后协商到的加密套。 |
| [`clientCertificate: ?Array<X509Certificate>`](prop-clientcertificate.md) | 客户端提供的客户端证书。 |
| [`domain: ?String`](prop-domain.md) | 读取协商到的服务端主机名称。 |
| [`override localAddress: SocketAddress`](prop-localaddress.md) | 读取 TlsSocket 的本地地址。 |
| [`peerCertificate: ?Array<X509Certificate>`](prop-peercertificate.md) | 获取对端证书。 |
| [`override mut readTimeout: ?Duration`](prop-readtimeout.md) | 读写 TlsSocket 的读超时时间。 |
| [`override remoteAddress: SocketAddress`](prop-remoteaddress.md) | 读取 TlsSocket 的远端地址。 |
| [`serverCertificate: Array<X509Certificate>`](prop-servercertificate.md) | 服务器证书链由服务器提供或在服务器配置中预先配置。 |
| [`session: ?TlsSession`](prop-session.md) | 读取 TLS 会话 id ，客户端会在握手成功后捕获当前会话的 id ，可使用该 id 重用该会话，省去 TLS 建立连接的时间。 |
| [`socket: StreamingSocket`](prop-socket.md) | TlsSocket 创建所使用的 StreamingSocket。 |
| [`tlsVersion: TlsVersion`](prop-tlsversion.md) | 读取协商到的 TLS 版本。 |
| [`override mut writeTimeout: ?Duration`](prop-writetimeout.md) | 读写 TlsSocket 的写超时时间。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static client( socket: StreamingSocket, session!: ?TlsSession = None, clientConfig!: TlsClientConfig = TlsClientConfig() ): TlsSocket`](client.md) | 根据传入的 StreamingSocket 实例创建指定地址的客户端 TLS 套接字，该套接字可用于客户端 TLS 握手及会话。 |
| [`static server( socket: StreamingSocket, sessionContext!: ?TlsSessionContext = None, serverConfig!: TlsServerConfig ): TlsSocket`](server.md) | 根据传入的 StreamingSocket 实例创建指定地址的服务端 TLS 套接字，该套接字可用于服务端 TLS 握手及会话。 |
| [`close(): Unit`](close.md) | 关闭套接字。 |
| [`handshake(timeout!: ?Duration = None): Unit`](handshake.md) | TLS 握手。 |
| [`override hashCode(): Int64`](hashcode.md) | 返回 TLS 套接字对象的哈希值。 |
| [`isClosed(): Bool`](isclosed.md) | 返回套接字是否关闭的状态。 |
| [`override read(buffer: Array<Byte>): Int64`](read.md) | TlsSocket 读取数据。 |
| [`toString(): String`](tostring.md) | 套接字的字符串表示，字符串内容为当前套接字状态。 |
| [`write(buffer: Array<Byte>): Unit`](write.md) | TlsSocket 发送数据。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`override operator !=(other: TlsSocket): Bool`](operator-ne.md) | 判断两 TlsSocket 是否引用不同实例。 |
| [`override operator ==(other: TlsSocket): Bool`](operator-eq.md) | 判断两 TlsSocket 是否引用同一实例。 |
