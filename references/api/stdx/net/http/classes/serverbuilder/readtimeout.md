<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.readtimeout" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.readTimeout

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func readTimeout(timeout: Duration): ServerBuilder
```

设定服务端读取一个请求的最大时长，超过该时长将不再进行读取并关闭连接，默认不进行限制。

## 契约

参数：

- timeout: Duration - 设定读请求的超时时间，如果传入时间为负值将被替换为 Duration.Zero。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。
