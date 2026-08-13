<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httprequest.prop-readtimeout" parent="stdx.net.http.class.httprequest" -->
# HttpRequest.readTimeout

[← HttpRequest](index.md)

## 签名

```cangjie role=signature
public prop readTimeout: ?Duration
```

表示该请求的请求级读超时时间。

## 契约

功能：表示该请求的请求级读超时时间。None 表示没有设置；Some(Duration) 表示设置了读超时时间。

类型：?Duration
