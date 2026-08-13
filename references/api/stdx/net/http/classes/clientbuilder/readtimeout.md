<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.clientbuilder.readtimeout" parent="stdx.net.http.class.clientbuilder" -->
# ClientBuilder.readTimeout

[← ClientBuilder](index.md)

## 签名

```cangjie role=signature
public func readTimeout(timeout: Duration): ClientBuilder
```

设定客户端读取一个响应的最大时长。

## 契约

参数：

- timeout: Duration - 默认 15s，Duration.Max 代表不限制，如果传入负的 Duration 将被替换为 Duration.Zero。

返回值：

- ClientBuilder - 当前 ClientBuilder 实例的引用。
