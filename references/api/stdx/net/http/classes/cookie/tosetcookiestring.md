<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.cookie.tosetcookiestring" parent="stdx.net.http.class.cookie" -->
# Cookie.toSetCookieString

[← Cookie](index.md)

## 签名

```cangjie role=signature
public func toSetCookieString(): String
```

提供将 Cookie 转成字符串形式的函数，方便 server 设置 `Set-Cookie` header。

## 契约

> **注意：**
>
> - Cookie 各属性（包含 name，value）在对象创建时就被检查了，因此 toSetCookieString() 函数不会产生异常；
> - Cookie 必需的属性是 cookie-pair 即 cookie-name "=" cookie-value，cookie-value 可以为空字符串，toSetCookieString() 函数只会将设置过的属性写入字符串，即只有 "cookie-name=" 是必有的，其余部分是否存在取决于是否设置。

返回值：

- String - 字符串对象，用于设置 `Set-Cookie` header。
