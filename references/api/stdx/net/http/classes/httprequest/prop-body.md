<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httprequest.prop-body" parent="stdx.net.http.class.httprequest" -->
# HttpRequest.body

[← HttpRequest](index.md)

## 签名

```cangjie role=signature
public prop body: InputStream
```

获取 body。

## 契约

> **注意：**
>
> - body 不支持并发读取；
> - 默认 InputStream 实现类的 read 函数不支持多次读取。

类型：InputStream
