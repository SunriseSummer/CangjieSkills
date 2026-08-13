<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.clientbuilder.poolsize" parent="stdx.net.http.class.clientbuilder" -->
# ClientBuilder.poolSize

[← ClientBuilder](index.md)

## 签名

```cangjie role=signature
public func poolSize(size: Int64): ClientBuilder
```

配置 HTTP/1.1 客户端使用的连接池的大小，亦可表示对同一个主机（host:port）同时存在的连接数的最大值。

## 契约

参数：

- size: Int64 - 默认 10，poolSize 需要大于 0。

返回值：

- ClientBuilder - 当前 ClientBuilder 实例的引用。

异常：

- HttpException - 如果传参小于等于 0，则会抛出该异常。
