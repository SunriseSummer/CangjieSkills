<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.interface.cookiejar.prop-ishttp" parent="stdx.net.http.interface.cookiejar" -->
# CookieJar.isHttp

[← CookieJar](index.md)

## 签名

```cangjie role=signature
prop isHttp: Bool
```

该 CookieJar 是否用于 HTTP 协议。

## 契约

- 若 isHttp 为 true， 则只会存储来自于 HTTP 协议的 Cookie。
- 若 isHttp 为 false， 则只会存储来自非 HTTP 协议的 Cookie，且不会存储发送设置了 httpOnly 的 Cookie。

类型：Bool
