<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httprequest.prop-form" parent="stdx.net.http.class.httprequest" -->
# HttpRequest.form

[← HttpRequest](index.md)

## 签名

```cangjie role=signature
public prop form: Form
```

获取请求中的表单信息。

## 契约

- 如果请求方法为 POST，PUT，PATCH，且 content-type 包含 application/x-www-form-urlencoded，获取请求 body 部分，用 form 格式解析；
- 如果请求方法不为 POST，PUT，PATCH，获取请求 url 中 query 部分。

> **注意：**
>
> - 如果用该接口读取了 body，body 已被消费完，后续将无法通过 body.read 读取 body；
> - 如果 form 不符合 Form 格式，抛 UrlSyntaxException 异常。

类型：Form
