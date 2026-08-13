<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.clientbuilder.build" parent="stdx.net.http.class.clientbuilder" -->
# ClientBuilder.build

[← ClientBuilder](index.md)

## 签名

```cangjie role=signature
public func build(): Client
```

构造 Client 实例。

## 契约

此处会对各参数的值进行检查，如果取值非法，将抛出异常。各参数的取值范围详见设置参数相关的函数。

返回值：

- Client - 用当前 ClientBuilder 实例中的配置构建的 Client 实例。

异常：

- IllegalArgumentException - 配置项有非法参数时抛出此异常。
