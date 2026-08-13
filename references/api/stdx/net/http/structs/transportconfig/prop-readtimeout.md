<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.struct.transportconfig.prop-readtimeout" parent="stdx.net.http.struct.transportconfig" -->
# TransportConfig.readTimeout

[← TransportConfig](index.md)

## 签名

```cangjie role=signature
public mut prop readTimeout: Duration
```

设定和读取传输层连接的读超时时间，如果设置的时间小于 0 将置为 0，默认值为 Duration.Max。

## 契约

类型：Duration
