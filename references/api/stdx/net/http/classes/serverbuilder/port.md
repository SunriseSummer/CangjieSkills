<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.port" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.port

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func port(port: UInt16): ServerBuilder
```

设置服务端监听端口，若 listener 被设定，此值被忽略。

## 契约

参数：

- port: UInt16 - 端口值。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。
