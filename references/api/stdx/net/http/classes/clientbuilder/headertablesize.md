<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.clientbuilder.headertablesize" parent="stdx.net.http.class.clientbuilder" -->
# ClientBuilder.headerTableSize

[← ClientBuilder](index.md)

## 签名

```cangjie role=signature
public func headerTableSize(size: UInt32): ClientBuilder
```

配置客户端 HTTP/2 Hpack 动态表初始值。

## 契约

参数：

- size: UInt32 - 默认值 4096。

返回值：

- ClientBuilder - 当前 ClientBuilder 实例的引用。
