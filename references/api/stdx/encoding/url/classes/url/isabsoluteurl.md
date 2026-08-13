<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.url.class.url.isabsoluteurl" parent="stdx.encoding.url.class.url" -->
# URL.isAbsoluteURL

[← URL](index.md)

## 签名

```cangjie role=signature
public func isAbsoluteURL(): Bool
```

判断 URL 是否为绝对 URL（scheme 存在时，URL 是绝对 URL）。

## 契约

返回值：

- Bool - scheme 存在时返回 true，不存在时返回 false。
