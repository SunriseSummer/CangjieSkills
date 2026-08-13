<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixsocket.prop-readtimeout" parent="std.net.class.unixsocket" -->
# UnixSocket.readTimeout

[← UnixSocket](index.md)

## 签名

```cangjie role=signature
public override mut prop readTimeout: ?Duration
```

设置和读取读操作超时时间。

## 契约

如果设置的时间过小将会设置为最小时钟周期值，过大时将设置为`None`，默认值为 `None`。

类型：?Duration

异常：

- IllegalArgumentException - 当超时时间小于 0 时，抛出异常。
