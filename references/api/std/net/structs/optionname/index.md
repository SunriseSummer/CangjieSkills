<!-- cj-doc kind="api-type" level="5" id="std.net.struct.optionname" parent="std.net" -->
# OptionName

[← std.net](../../index.md)

`OptionName`

提供了常用的套接字选项。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`IP_HDRINCL: Int32`](field-ip_hdrincl.md) | 用于在发送数据包时指定 IP 头部是否由应用程序提供的套接字选项。 |
| [`IP_TOS: Int32`](field-ip_tos.md) | 用于指定数据包服务类型和优先级的套接字选项。 |
| [`IP_TTL: Int32`](field-ip_ttl.md) | 用于限制 IP 数据包在网络中传输最大跳数的套接字选项。 |
| [`SO_ACCEPTCONN: Int32`](field-so_acceptconn.md) | 用于查询套接字是否处于监听状态的套接字选项。 |
| [`SO_BROADCAST: Int32`](field-so_broadcast.md) | 用于设置套接字是否允许发送广播消息的套接字选项。 |
| [`SO_DEBUG: Int32 = 0x0001`](field-so_debug.md) | 用于启用或禁用调试模式的套接字选项。 |
| [`SO_DONTROUTE: Int32`](field-so_dontroute.md) | 用于在连接套接字时，不路由套接字数据包的套接字选项。 |
| [`SO_ERROR: Int32`](field-so_error.md) | 获取和清除套接字上错误状态的套接字选项。 |
| [`SO_KEEPALIVE: Int32`](field-so_keepalive.md) | 用于检测 `TCP` 连接是否仍然处于活动状态的套接字选项。 |
| [`SO_LINGER: Int32`](field-so_linger.md) | 用于设置套接字关闭时行为的套接字选项。 |
| [`SO_OOBINLINE: Int32`](field-so_oobinline.md) | 用于控制接收带外数据方式的套接字选项。 |
| [`SO_RCVBUF: Int32`](field-so_rcvbuf.md) | 用于设置套接字接收缓冲区大小的套接字选项。 |
| [`SO_RCVTIMEO: Int32`](field-so_rcvtimeo.md) | 用于设置套接字接收数据超时时间的套接字选项。 |
| [`SO_REUSEADDR: Int32`](field-so_reuseaddr.md) | 用于在套接字关闭后立即释放其绑定端口，以便其他套接字可以立即绑定该端口的套接字选项。 |
| [`SO_SNDBUF: Int32`](field-so_sndbuf.md) | 用于设置套接字发送缓冲区大小的套接字选项。 |
| [`SO_SNDTIMEO: Int32`](field-so_sndtimeo.md) | 用于设置套接字发送数据超时时间的套接字选项。 |
| [`TCP_KEEPCNT: Int32`](field-tcp_keepcnt.md) | 用于控制 TCP 连接中发送保持存活探测报文次数的套接字选项。 |
| [`TCP_KEEPIDLE: Int32`](field-tcp_keepidle.md) | 用于设置在没有收到对端确认的情况下，`TCP` 保持连接最大次数的套接字选项。 |
| [`TCP_KEEPINTVL: Int32`](field-tcp_keepintvl.md) | 用于设置 `TCP` 保持连接时发送探测报文时间间隔的套接字选项。 |
| [`TCP_NODELAY: Int32 = 0x0001`](field-tcp_nodelay.md) | 用于控制 `TCP` 协议延迟行为的套接字选项。 |
