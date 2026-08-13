<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.client.upgrade" parent="stdx.net.http.class.client" -->
# Client.upgrade

[← Client](index.md)

## 签名

```cangjie role=signature
public func upgrade(req: HttpRequest): (HttpResponse, ?StreamingSocket)
```

发送请求并升级协议，用户设置请求头，返回升级后的连接（如果升级成功），连接由用户负责关闭。

## 契约

> **说明：**
>
> - 服务器返回 101 表示升级成功，获取到了 StreamingSocket；
> - 必选请求头：
>     - Upgrade:  protocol-name ["/" protocol-version]；
>     - Connection: Upgrade（在请求头包含 Upgrade 字段时会自动添加）；
> - 不支持 HTTP/1.0、HTTP/2；
> - 不支持 HTTP/1.1 CONNECT 方法的 HttpRequest。

参数：

- req: HttpRequest - 升级时发送的请求。

返回值：

- (HttpResponse,?StreamingSocket) - 返回一个元组，HttpResponse 实例表示服务器返回的响应，?StreamingSocket 实例表示获取的底层连接，升级失败时为 None。

异常：

- HttpException -
    - 请求报文或响应报文不符合协议；
    - 请求报文不含 Upgrade 头；
    - 发送 CONNECT 请求；
    - 发送带 body 的 TRACE 请求；
- SocketException，ConnectionException - Socket 连接出现异常或被关闭；
- SocketTimeoutException - Socket 连接超时；
- TlsException - Tls 连接建立失败或通信异常。
