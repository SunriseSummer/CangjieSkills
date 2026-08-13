<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.url.class.url.replace" parent="stdx.encoding.url.class.url" -->
# URL.replace

[← URL](index.md)

## 签名

```cangjie role=signature
public func replace(scheme!: Option<String> = None, userInfo!: Option<String> = None,
 hostName!: Option<String> = None, port!: Option<String> = None, path!: Option<String> = None, 
 query!: Option<String> = None, fragment!: Option<String> = None): URL
```

替换 URL 对象的各组件，并且返回一个新的 URL 对象。

## 契约

替换时需要满足以下要求：

- 方案 scheme 为空时，主机名必须为空。
- 主机名为空时，用户信息或端口号必须为空。
- 方案 scheme 不为空时，主机名和路径不能同时为空。
- 方案 scheme 不为空时，路径必须是绝对路径。
- 任意组件均为合法字符。

参数：

- scheme!: Option\<String> - 协议组件。
- userInfo!: Option\<String> - 用户信息。
- hostName!: Option\<String> - 主机名。
- port!: Option\<String> - 端口号。
- path!: Option\<String> - 资源路径。
- query!: Option\<String> - 查询组件。
- fragment!: Option\<String> - 锚点组件。

返回值：

- URL - 新的 URL 对象。

异常：

- UrlSyntaxException - 不满足替换要求时，抛出异常。
