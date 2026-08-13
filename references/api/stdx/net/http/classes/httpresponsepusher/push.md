<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httpresponsepusher.push" parent="stdx.net.http.class.httpresponsepusher" -->
# HttpResponsePusher.push

[← HttpResponsePusher](index.md)

## 签名

```cangjie role=signature
public func push(path: String, method: String, header: HttpHeaders): Unit
```

向客户端发送推送请求，path 为请求地址，method 为请求方法，header 为请求头。

## 契约

参数：

- path: String - 推送的请求地址。
- method: String - 推送的请求方法。
- header: HttpHeaders - 推送的请求头。
