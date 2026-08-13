<!-- cj-doc kind="api-member" level="6" id="std.net.struct.socketkeepaliveconfig.init" parent="std.net.struct.socketkeepaliveconfig" -->
# SocketKeepAliveConfig.init

[← SocketKeepAliveConfig](index.md)

## 签名

```cangjie role=signature
public init(idle!: Duration = Duration.second * 45, interval!: Duration = Duration.second * 5, count!: UInt32 = 5)
```

初始化 SocketKeepAliveConfig 实例对象。

## 契约

参数：

- idle!: Duration - 允许空闲的时长，默认 45 秒。
- interval!: Duration - 保活报文发送周期，默认 45 秒。
- count!: UInt32 - 查询连接是否失效的报文个数， 默认 5 个。

异常：

- IllegalArgumentException - 当配置为空闲状态或设置间隔小于 0 时，抛出异常。
