<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.interface.cookiejar.prop-rejectpublicsuffixes" parent="stdx.net.http.interface.cookiejar" -->
# CookieJar.rejectPublicSuffixes

[← CookieJar](index.md)

## 签名

```cangjie role=signature
prop rejectPublicSuffixes: ArrayList<String>
```

获取 public suffixes 配置，该配置是一个 domain 黑名单，会拒绝 domain 值为 public suffixes 的 Cookie。

## 契约

> **说明：**
>
> 如果该 Cookie 来自于与 domain 相同的 host，黑名单就不会生效。

类型：ArrayList\<String>
