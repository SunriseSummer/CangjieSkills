<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.maxheaderlistsize" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.maxHeaderListSize

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func maxHeaderListSize(size: UInt32): ServerBuilder
```

获取客户端支持的 HTTP/2 最大头部（Header）大小。

## 契约

功能：获取客户端支持的 HTTP/2 最大头部（Header）大小。这个大小指的是响应头部中所有头部字段（Header Field）的最大允许长度之和，其中包括所有字段名称（name）的长度、字段值（value）的长度以及每个字段自动添加的伪头开销（通常每个字段会有 32 字节的开销，这包括了 HTTP/2 协议本身为头部字段添加的伪头部信息）。默认情况下，这个最大长度被设置为 UInt32.Max。

参数：

- size: UInt32 - 本端接收的报文头最大长度。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。
