<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.writetimeout" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.writeTimeout

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func writeTimeout(timeout: Duration): ServerBuilder
```

设定服务端发送一个响应的最大时长，超过该时长将不再进行写入并关闭连接，默认不进行限制。

## 契约

参数：

- timeout: Duration - 设定写响应的超时时间，如果传入时间为负值将被替换为 Duration.Zero。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。
