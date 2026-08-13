<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.listener" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.listener

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func listener(listener: ServerSocket): ServerBuilder
```

服务端调用此函数对指定 socket 进行绑定监听。

## 契约

参数：

- listener: ServerSocket - 所绑定的 socket。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。
