<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.interface.cookiejar.removecookies" parent="stdx.net.http.interface.cookiejar" -->
# CookieJar.removeCookies

[← CookieJar](index.md)

## 签名

```cangjie role=signature
func removeCookies(domain: String): Unit
```

从 CookieJar 中移除某个 domain 的 Cookie。

## 契约

> **说明：**
>
> 默认实现 CookieJarImpl 的移除某个 domain 的 Cookie 只会移除特定 domain 的 Cookie，domain 的 subdomain 的 Cookie 并不会移除。

参数：

- domain: String - 所要移除 Cookie 的域名。

异常：

- IllegalArgumentException - 如果传入的 domain 为空字符串或者非法，则抛出该异常，合法的 domain 规则见 Cookie 的参数文档。
