<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.headertablesize" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.headerTableSize

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func headerTableSize(size: UInt32): ServerBuilder
```

设置服务端 HTTP/2 Hpack 动态表的初始值，默认值为 4096。

## 契约

参数：

- size: UInt32 - 本端对响应头编码时使用的最大 `table size`

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。
