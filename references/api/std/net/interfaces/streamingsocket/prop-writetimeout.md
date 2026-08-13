<!-- cj-doc kind="api-member" level="6" id="std.net.interface.streamingsocket.prop-writetimeout" parent="std.net.interface.streamingsocket" -->
# StreamingSocket.writeTimeout

[← StreamingSocket](index.md)

## 签名

```cangjie role=signature
mut prop writeTimeout: ?Duration
```

设置和读取写超时时间。

## 契约

如果设置的时间过小将会设置为最小时钟周期值；过大时将设置为最大超时时间（2<sup>63</sup>-1 纳秒）；默认值为 `None`。

类型：?Duration

异常：

- IllegalArgumentException - 当超时时间小于 0 时，抛出异常。
