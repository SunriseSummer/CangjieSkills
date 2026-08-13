<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httprequest.tostring" parent="stdx.net.http.class.httprequest" -->
# HttpRequest.toString

[← HttpRequest](index.md)

## 签名

```cangjie role=signature
public override func toString(): String
```

把请求转换为字符串，包括 start line，headers，body size，trailers。

## 契约

功能：把请求转换为字符串，包括 start line，headers，body size，trailers。
例如：`"GET /path HTTP/1.1\r\nhost: www.example.com\r\n\r\nbody size: 5\r\nbar: foo\r\n"`。

返回值：

- String - 请求的字符串表示。
