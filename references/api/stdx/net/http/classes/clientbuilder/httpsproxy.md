<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.clientbuilder.httpsproxy" parent="stdx.net.http.class.clientbuilder" -->
# ClientBuilder.httpsProxy

[← ClientBuilder](index.md)

## 签名

```cangjie role=signature
public func httpsProxy(addr: String): ClientBuilder
```

设置客户端 https 代理，默认使用系统环境变量 https_proxy 的值。

## 契约

参数：

- addr: String - 格式为：`"http://host:port"`，例如：`"http://192.168.1.1:443"`。

返回值：

- ClientBuilder - 当前 ClientBuilder 实例的引用。
