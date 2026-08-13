<!-- cj-doc kind="api-type" level="5" id="stdx.encoding.url.class.url" parent="stdx.encoding.url" -->
# URL

[← stdx.encoding.url](../../index.md)

`URL <: ToString`

该类提供解析 URL 的函数以及其他相关函数。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`fragment: ?String`](prop-fragment.md) | 获取解码后的锚点组件，用字符串表示。 |
| [`host: String`](prop-host.md) | 获取解码后的主机名和端口部分，用字符串表示。 |
| [`hostName: String`](prop-hostname.md) | 获取解码后的主机名，用字符串表示。 |
| [`opaque: String`](prop-opaque.md) | 获取 URL 中未被解析的部分，用字符串表示。 |
| [`path: String`](prop-path.md) | 获取解码后的路径，用字符串表示。 |
| [`port: String`](prop-port.md) | 获取端口号，用字符串表示，空字符串表示无端口号。 |
| [`query: ?String`](prop-query.md) | 获取解码后的查询组件，用字符串表示。 |
| [`queryForm: Form`](prop-queryform.md) | 获取解码后的查询组件，用 Form 实例表示。 |
| [`rawFragment: ?String`](prop-rawfragment.md) | 获取解码前的锚点组件，用字符串表示。 |
| [`rawPath: String`](prop-rawpath.md) | 获取解码前的路径，用字符串表示。 |
| [`rawQuery: ?String`](prop-rawquery.md) | 获取解码前的查询组件，用字符串表示。 |
| [`rawUserInfo: UserInfo`](prop-rawuserinfo.md) | 获取解码前的用户名和密码信息，用 UserInfo 实例表示。 |
| [`scheme: String`](prop-scheme.md) | 获取 URL 中协议部分，用字符串表示。 |
| [`userInfo: UserInfo`](prop-userinfo.md) | 获取解码后的用户名和密码信息，用 UserInfo 实例表示。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(scheme!: String, hostName!: String, path!: String)`](init.md) | 构造一个 URL 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static mergePaths(basePath: String, refPath: String): String`](mergepaths.md) | 合并两个路径。 |
| [`static parse(rawUrl: String): URL`](parse.md) | 将原始 URL 字符串解析成 URL 对象。 |
| [`isAbsoluteURL(): Bool`](isabsoluteurl.md) | 判断 URL 是否为绝对 URL（scheme 存在时，URL 是绝对 URL）。 |
| [`replace(scheme!: Option<String> = None, userInfo!: Option<String> = None, hostName!: Option<String> = None, port!: Option<String> = None, path!: Option<String> = None, query!: Option<String> = None, fragment!: Option<String> = None): URL`](replace.md) | 替换 URL 对象的各组件，并且返回一个新的 URL 对象。 |
| [`resolveURL(ref: URL): URL`](resolveurl.md) | 以当前 URL 实例为基础 URL，以传入的 URL 为参考 URL，根据 RFC 3986 协议生成一个新的 URL 实例。 |
| [`toString(): String`](tostring.md) | 获取当前 URL 实例的字符串值。 |
