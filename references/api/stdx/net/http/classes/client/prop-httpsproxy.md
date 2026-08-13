<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.client.prop-httpsproxy" parent="stdx.net.http.class.client" -->
# Client.httpsProxy

[← Client](index.md)

## 签名

```cangjie role=signature
public prop httpsProxy: String
```

获取客户端 https 代理，默认使用系统环境变量 https_proxy 的值，用字符串表示，格式为：`"http://host:port"`，例如：`"http://192.168.1.1:443"`。

## 契约

类型：String
