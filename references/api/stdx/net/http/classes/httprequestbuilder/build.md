<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httprequestbuilder.build" parent="stdx.net.http.class.httprequestbuilder" -->
# HttpRequestBuilder.build

[← HttpRequestBuilder](index.md)

## 签名

```cangjie role=signature
public func build(): HttpRequest
```

根据 HttpRequestBuilder 实例生成一个 HttpRequest 实例。

## 契约

返回值：

- HttpRequest - 根据当前 HttpRequestBuilder 实例构造出来的 HttpRequest 实例。

## 典型示例

`HttpRequestBuilder` 用链式方法集中设置 method、URL、header 和 body；`build()` 生成请求快照，本身不发起网络连接，适合先在本地验证请求内容。

```cangjie cjtest=run id=api.stdx.http.request-build.run form=unit requires=stdx timeout=60s
package stdx_http_request_build_example

import stdx.net.http.*

main(): Unit {
    let request = HttpRequestBuilder()
        .post()
        .url("https://api.example.com/items?limit=2")
        .header("Accept", "application/json")
        .body("{}")
        .build()

    println(request.method)
    println(request.url.host)
    println(request.headers.getFirst("Accept").getOrThrow())
    println(request.bodySize.getOrThrow())
}
```

```text cjtest=expect for=api.stdx.http.request-build.run stream=stdout match=exact
POST
api.example.com
application/json
2
```
