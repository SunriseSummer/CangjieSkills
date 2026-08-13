<!-- cj-doc kind="api-type" level="5" id="std.net.struct.socketkeepaliveconfig" parent="std.net" -->
# SocketKeepAliveConfig

[← std.net](../../index.md)

`SocketKeepAliveConfig <: ToString & Equatable<SocketKeepAliveConfig>`

TCP KeepAlive 属性配置。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`count: UInt32`](field-count.md) | 查询连接是否失效的报文个数。 |
| [`idle: Duration`](field-idle.md) | 允许连接空闲的时长，空闲超长将关闭连接。 |
| [`interval: Duration`](field-interval.md) | 保活报文发送周期。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(idle!: Duration = Duration.second * 45, interval!: Duration = Duration.second * 5, count!: UInt32 = 5)`](init.md) | 初始化 SocketKeepAliveConfig 实例对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`override toString(): String`](tostring.md) | 将 TCP KeepAlive 属性配置转换为字符串。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`override operator !=(other: SocketKeepAliveConfig): Bool`](operator-ne.md) | 判断两个 SocketKeepAliveConfig 实例是否不等。 |
| [`override operator ==(other: SocketKeepAliveConfig): Bool`](operator-eq.md) | 判断两个 SocketKeepAliveConfig 实例是否相等。 |
