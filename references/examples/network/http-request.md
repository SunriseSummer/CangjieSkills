<!-- cj-doc kind="example-leaf" level="4" id="examples.network.http-request" parent="examples.network" -->
# 构造 HTTP 请求

[← HTTP、URL 与 WebSocket](index.md)

用 builder 明确方法、URL、头和 body，再生成不可变请求对象。

## 典型示例

`HttpRequestBuilder` 用链式方法集中设置 method、URL、header 和 body；`build()` 生成请求快照，本身不发起网络连接，适合先在本地验证请求内容。

```cangjie cjtest=run id=examples.network.http-request.api.stdx.http.request-build.run form=unit requires=stdx timeout=60s
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

预期标准输出：

```text cjtest=expect for=examples.network.http-request.api.stdx.http.request-build.run stream=stdout match=exact
POST
api.example.com
application/json
2
```
