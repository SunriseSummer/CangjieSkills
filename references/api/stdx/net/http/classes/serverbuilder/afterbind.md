<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.afterbind" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.afterBind

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func afterBind(f: ()->Unit): ServerBuilder
```

注册服务器启动时的回调函数，服务内部 ServerSocket 实例 bind 之后，accept 之前将调用该函数。

## 契约

功能：注册服务器启动时的回调函数，服务内部 ServerSocket 实例 bind 之后，accept 之前将调用该函数。重复调用将覆盖之前注册的函数。

参数：

- f: () ->Unit - 回调函数，入参为空，返回值为 Unit 类型。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。
