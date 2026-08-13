<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.struct.transportconfig" parent="stdx.net.http" -->
# TransportConfig

[← stdx.net.http](../../index.md)

`TransportConfig`

传输层配置类，服务器建立连接使用的传输层配置。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut keepAliveConfig: SocketKeepAliveConfig`](prop-keepaliveconfig.md) | 设定和读取传输层连接的消息保活配置，默认配置空闲时间为 45s，发送探测报文的时间间隔为 5s，在连接被认为无效之前发送的探测报文数 5 次，实际时间粒度可能因操作系统而异。 |
| [`mut readBufferSize: ?Int64`](prop-readbuffersize.md) | 设定和读取传输层连接的读缓冲区大小，默认值为 None ，若设置的值小于 0，将在服务器进行服务建立连接后抛出 IllegalArgumentException。 |
| [`mut readTimeout: Duration`](prop-readtimeout.md) | 设定和读取传输层连接的读超时时间，如果设置的时间小于 0 将置为 0，默认值为 Duration.Max。 |
| [`mut writeBufferSize: ?Int64`](prop-writebuffersize.md) | 设定和读取传输层连接的写缓冲区大小，默认值为 None ，若设置的值小于 0，将在服务器进行服务建立连接后抛出 IllegalArgumentException。 |
| [`mut writeTimeout: Duration`](prop-writetimeout.md) | 设定和读取传输层连接的写超时时间，如果设置的时间小于 0 将置为 0，默认值为 Duration.Max。 |
