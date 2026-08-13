<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httpresponse.prop-bodysize" parent="stdx.net.http.class.httpresponse" -->
# HttpResponse.bodySize

[← HttpResponse](index.md)

## 签名

```cangjie role=signature
public prop bodySize: Option<Int64>
```

获取响应 body 长度。

## 契约

> - 如果未设置 body，则 bodySize 为 Some(0)；
> - 如果 body 长度已知，即通过 Array\<UInt8> 或 String 传入 body，或传入的 InputStream 有确定的 length (length >= 0)，则 bodySize 为 Some(Int64)；
> - 如果 body 长度未知，即通过用户自定义的 InputStream 实例传入 body 且 InputStream 实例没有确定的 length (length < 0)，则 bodySize 为 None。

类型：Option\<Int64>
