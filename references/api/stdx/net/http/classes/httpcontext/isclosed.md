<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httpcontext.isclosed" parent="stdx.net.http.class.httpcontext" -->
# HttpContext.isClosed

[← HttpContext](index.md)

## 签名

```cangjie role=signature
public func isClosed(): Bool
```

使用 HTTP/1.1 协议时，判断 socket 是否已关闭；使用 HTTP/2 协议时，判断 HTTP/2 流是否已关闭。

## 契约

返回值：

- Bool - 如果 HTTP/1.1 的 socket 或 HTTP/2 的流已关闭，返回 true，否则返回 false。
