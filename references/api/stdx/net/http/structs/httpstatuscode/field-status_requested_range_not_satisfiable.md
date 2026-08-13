<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.struct.httpstatuscode.field-status_requested_range_not_satisfiable" parent="stdx.net.http.struct.httpstatuscode" -->
# HttpStatusCode.STATUS_REQUESTED_RANGE_NOT_SATISFIABLE

[← HttpStatusCode](index.md)

## 签名

```cangjie role=signature
public static const STATUS_REQUESTED_RANGE_NOT_SATISFIABLE: UInt16 = 416
```

客户端请求的范围无效。

## 契约

类型：UInt16

> **说明：**
>
> 请求中包含了 `Range` 请求头，并且 `Range` 中指定的任何数据范围都与当前资源的可用范围不重合；
> 同时请求中又没有定义 `If-Range` 请求头。
