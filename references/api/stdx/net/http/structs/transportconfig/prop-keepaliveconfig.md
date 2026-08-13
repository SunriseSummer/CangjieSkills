<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.struct.transportconfig.prop-keepaliveconfig" parent="stdx.net.http.struct.transportconfig" -->
# TransportConfig.keepAliveConfig

[← TransportConfig](index.md)

## 签名

```cangjie role=signature
public mut prop keepAliveConfig: SocketKeepAliveConfig
```

设定和读取传输层连接的消息保活配置，默认配置空闲时间为 45s，发送探测报文的时间间隔为 5s，在连接被认为无效之前发送的探测报文数 5 次，实际时间粒度可能因操作系统而异。

## 契约

类型：SocketKeepAliveConfig
