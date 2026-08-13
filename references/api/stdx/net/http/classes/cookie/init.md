<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.cookie.init" parent="stdx.net.http.class.cookie" -->
# Cookie.init

[← Cookie](index.md)

## 签名

```cangjie role=signature
public init(name: String, value: String, expires!: ?DateTime = None, maxAge!: ?Int64 = None,
    domain!: String = "", path!: String = "", secure!: Bool = false, httpOnly!: Bool = false)
```

Cookie 构造器。

## 契约

功能：Cookie 构造器。该构造器会检查传入的各项属性是否满足协议要求，如果不满足则会产生 IllegalArgumentException。具体要求见 RFC 6265 4.1.1.。

> **注意：**
>
> Cookie 各属性中只有 cookie-name，cookie-value 是必需的，必须传入 name，value 参数，但 value 参数可以传入空字符串。

参数：

- name: String - cookie-name 属性。

- value: String - cookie-value 属性。

- expires!: ?DateTime - 设置 Cookie 的过期时间，默认为 None，时间必须在 1601 年之后。
- maxAge!: ?Int64 - Cookie 的最大生命周期，默认为 None，如果 Cookie 既有 expires 属性，也有 maxAge，则表示该 Cookie 只维护到会话结束（维护到 Client 关闭之前，Client 关闭之后设置了过期的 Cookie 也不再维护）。

- domain!: String - 默认为空字符串，表示该收到该 Cookie 的客户端只会发送该 Cookie 给原始服务器。如果设置了合法的 domain，则收到该 Cookie 的客户端只会发送该 Cookie 给所有该 domain 的子域（且满足其他属性条件要求才会发）。

- path!: String - 默认为空字符串，客户端会根据 url 计算出默认的 path 属性，见 RFC 6265 5.1.4.。 收到该 Cookie 的客户端只会发送该 Cookie 给所有该 path 的子目录（且满足其他属性条件要求才会发）。

- secure!: Bool - 默认为 false，如果设置为 true，该 Cookie 只会在安全协议请求中发送。
- httpOnly!: Bool - 默认为 false，如果设置为 true，该 Cookie 只会在 HTTP 协议请求中发送。

异常：

- IllegalArgumentException - 传入的参数不符合协议要求时抛出异常。
