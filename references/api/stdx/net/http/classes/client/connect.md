<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.client.connect" parent="stdx.net.http.class.client" -->
# Client.connect

[← Client](index.md)

## 签名

```cangjie role=signature
public func connect(url: String, header!: HttpHeaders = HttpHeaders(), version!: Protocol = HTTP1_1): (HttpResponse, ?StreamingSocket)
```

发送 CONNECT 请求与服务器建立隧道，返回建连成功后的连接，连接由用户负责关闭。

## 契约

功能：发送 CONNECT 请求与服务器建立隧道，返回建连成功后的连接，连接由用户负责关闭。服务器返回 2xx 表示建连成功，否则建连失败（不支持自动重定向，3xx 也视为失败）。

参数：

- url: String - 请求的 url。
- header!: HttpHeaders - 请求头，默认为空请求头。
- version!: Protocol - 请求的协议，默认为 HTTP1_1。

返回值：

- (HttpResponse, ?StreamingSocket) - 返回元组类型，其中 HttpResponse 实例表示服务器返回的响应体，Option\<StreamingSocket> 实例表示请求成功时返回 headers 之后连接。

异常：

- UrlSyntaxException - 当参数 url 不符合 URL 解析规范时，抛出异常。
- IllegalArgumentException - 当被编码的字符不符合 UTF-8 的字节序列规则时，抛出异常。
- 其余同 func send。
