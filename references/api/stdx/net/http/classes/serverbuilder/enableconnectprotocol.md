<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.enableconnectprotocol" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.enableConnectProtocol

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func enableConnectProtocol(flag: Bool): ServerBuilder
```

HTTP/2 专用，设置本端是否接收 CONNECT 请求，默认 false。

## 契约

参数：

- flag: Bool - 本端是否接收 CONNECT 请求。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。
