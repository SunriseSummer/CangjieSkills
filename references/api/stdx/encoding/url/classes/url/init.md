<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.url.class.url.init" parent="stdx.encoding.url.class.url" -->
# URL.init

[← URL](index.md)

## 签名

```cangjie role=signature
public init(scheme!: String, hostName!: String, path!: String)
```

构造一个 URL 实例。

## 契约

构造实例时需要满足要求：

- 拥有主机名 hostName 时，需要有协议 scheme。
- 不能只存在协议 scheme。
- 存在协议和路径的情况下，路径 path 必须是绝对路径。

参数：

- scheme!: String - 协议类型。
- hostName!: String - 不包含端口号的主机名。
- path!: String - 请求资源的路径。

异常：

- UrlSyntaxException - 当构造实例不满足要求时，抛出异常。
