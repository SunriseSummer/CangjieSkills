<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.protocolservicefactory" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.protocolServiceFactory

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func protocolServiceFactory(factory: ProtocolServiceFactory): ServerBuilder
```

设置协议服务工厂，服务协议工厂会生成每个协议所需的服务实例，不设置时使用默认工厂。

## 契约

参数：

- factory: ProtocolServiceFactory - 自定义工厂实例。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。
