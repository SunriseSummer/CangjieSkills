<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.struct.transportconfig.prop-writetimeout" parent="stdx.net.http.struct.transportconfig" -->
# TransportConfig.writeTimeout

[← TransportConfig](index.md)

## 签名

```cangjie role=signature
public mut prop writeTimeout: Duration
```

设定和读取传输层连接的写超时时间，如果设置的时间小于 0 将置为 0，默认值为 Duration.Max。

## 契约

类型：Duration
