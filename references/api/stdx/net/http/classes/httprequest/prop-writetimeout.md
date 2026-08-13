<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httprequest.prop-writetimeout" parent="stdx.net.http.class.httprequest" -->
# HttpRequest.writeTimeout

[← HttpRequest](index.md)

## 签名

```cangjie role=signature
public prop writeTimeout: ?Duration
```

表示该请求的请求级写超时时间，None 表示没有设置；Some(Duration) 表示设置了写超时时间。

## 契约

类型：?Duration
