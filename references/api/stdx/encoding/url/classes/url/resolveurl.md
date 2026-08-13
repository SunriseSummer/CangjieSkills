<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.url.class.url.resolveurl" parent="stdx.encoding.url.class.url" -->
# URL.resolveURL

[← URL](index.md)

## 签名

```cangjie role=signature
public func resolveURL(ref: URL): URL
```

以当前 URL 实例为基础 URL，以传入的 URL 为参考 URL，根据 RFC 3986 协议生成一个新的 URL 实例。

## 契约

例如：<http://a/b/c/d;p?q> 为基础 URL，以下 = 左边为参考 URL，右边为生成的新 URL：

- "g"      =  "<http://a/b/c/g>"
- "/g"     =  "<http://a/g>"
- "g?y"    =  "<http://a/b/c/g?y>"
- "g?y#s"  =  "<http://a/b/c/g?y#s>"
- "../"    =  "<http://a/b/>"

更多详细的 URL 生成规则，请参见 RFC 3968 协议。

参数：

- ref: URL - 参考 URL 对象。

返回值：

- URL - 新的 URL 实例。
