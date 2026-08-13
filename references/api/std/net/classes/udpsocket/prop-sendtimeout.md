<!-- cj-doc kind="api-member" level="6" id="std.net.class.udpsocket.prop-sendtimeout" parent="std.net.class.udpsocket" -->
# UdpSocket.sendTimeout

[← UdpSocket](index.md)

## 签名

```cangjie role=signature
public override mut prop sendTimeout: ?Duration
```

设置和读取 `send/sendTo` 操作超时时间。

## 契约

如果设置的时间过小将会设置为最小时钟周期值；过大时将设置为最大超时时间（2<sup>63</sup>-1 纳秒）；默认值为 `None`。

类型：?Duration
