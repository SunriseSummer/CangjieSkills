<!-- cj-doc kind="api-member" level="6" id="std.net.class.rawsocket.prop-writetimeout" parent="std.net.class.rawsocket" -->
# RawSocket.writeTimeout

[← RawSocket](index.md)

## 签名

```cangjie role=signature
public mut prop writeTimeout: ?Duration
```

获取或设置当前 RawSocket 实例的写超时时间。

## 契约

类型：?Duration

异常：

- SocketException - 当前 RawSocket 实例已经关闭时，抛出异常。
- IllegalArgumentException - 当设置的写超时时间为负时，抛出异常。
