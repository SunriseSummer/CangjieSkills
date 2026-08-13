<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httpresponse.tostring" parent="stdx.net.http.class.httpresponse" -->
# HttpResponse.toString

[← HttpResponse](index.md)

## 签名

```cangjie role=signature
public override func toString(): String
```

把响应转换为字符串，包括 status-line，headers，body size， trailers。

## 契约

例如：HTTP/1.1 200 OK\r\ncontent-length: 5\r\n\r\nbody size: 5\r\nbar: foo\r\n。

返回值：

- String - 响应的字符串表示。
