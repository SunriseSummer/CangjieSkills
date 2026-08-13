<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.url.class.userinfo.password" parent="stdx.encoding.url.class.userinfo" -->
# UserInfo.password

[← UserInfo](index.md)

## 签名

```cangjie role=signature
public func password(): Option<String>
```

获取密码信息。

## 契约

> **注意：**
>
> RFC 3986 明确指出，任何场景下，明文保存用户信息存在被泄露风险，所以建议不要在 URL 中明文保存用户信息。

返回值：

- Option\<String> - 将密码以 Option\<String> 形式返回。
