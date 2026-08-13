<!-- cj-doc kind="api-member" level="7" id="stdx.net.http.class.httpresponse.getpush" parent="stdx.net.http.class.httpresponse.extension.extend-httpresponse" -->
# HttpResponse.getPush

[← extend HttpResponse](extensions/extend-httpresponse.md)

## 签名

```cangjie role=signature
public func getPush(): Option<ArrayList<HttpResponse>>
```

获取服务器推送的响应，返回 None 代表未开启服务器推送功能，返回空 ArrayList 代表无服务器推送的响应。

## 契约

返回值：

- Option\<ArrayList\<HttpResponse>> - 服务器推送的响应列表。
