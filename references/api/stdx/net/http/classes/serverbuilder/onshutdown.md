<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.onshutdown" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.onShutdown

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func onShutdown(f: () -> Unit): ServerBuilder
```

注册服务器关闭时的回调函数，服务器关闭时将调用该回调函数，重复调用将覆盖之前注册的函数。

## 契约

参数：

- f: () ->Unit - 回调函数，入参为空，返回值为 Unit 类型。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。
