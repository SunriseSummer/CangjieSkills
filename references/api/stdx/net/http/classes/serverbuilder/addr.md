<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.addr" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.addr

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func addr(addr: String): ServerBuilder
```

设置服务端监听地址，若 listener 被设定，此值被忽略。

## 契约

格式需符合 IPAddress 中相关规定。

参数：

- addr: String - 地址值。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。
