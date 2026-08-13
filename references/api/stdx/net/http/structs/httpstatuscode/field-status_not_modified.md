<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.struct.httpstatuscode.field-status_not_modified" parent="stdx.net.http.struct.httpstatuscode" -->
# HttpStatusCode.STATUS_NOT_MODIFIED

[← HttpStatusCode](index.md)

## 签名

```cangjie role=signature
public static const STATUS_NOT_MODIFIED: UInt16 = 304
```

请求的资源未修改，服务器返回此状态码时，不会返回任何资源。

## 契约

类型：UInt16

> **说明：**
>
> 客户端通常会缓存访问过的资源，通过提供一个头信息指出客户端希望只返回在指定日期之后修改的资源。
