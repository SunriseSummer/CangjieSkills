<!-- cj-doc kind="api-extension" level="6" id="stdx.net.http.class.httpresponse.extension.extend-httpresponse" parent="stdx.net.http.class.httpresponse" -->
# extend HttpResponse

[← HttpResponse](../index.md)

`extend HttpResponse`

为 HttpResonse 扩展 HTTP/2.0 特有的方法。

## 成员

| 签名 | 功能 |
|---|---|
| [`getPush(): Option<ArrayList<HttpResponse>>`](../getpush.md) | 获取服务器推送的响应，返回 None 代表未开启服务器推送功能，返回空 ArrayList 代表无服务器推送的响应。 |
