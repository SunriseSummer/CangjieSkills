<!-- cj-doc kind="example-leaf" level="4" id="examples.network.url-parse" parent="examples.network" -->
# 解析并检查 URL

[← HTTP、URL 与 WebSocket](index.md)

从字符串构造 URL，并读取 scheme、host、port 和 path 等结构化字段。

## 典型示例

`URL.parse` 同时保留解码后的组件和 `rawXxx` 原始编码组件；相对引用可再交给 `resolveURL` 按 RFC 3986 与基础 URL 合并。

```cangjie cjtest=run id=examples.network.url-parse.api.stdx.url.parse.run form=unit requires=stdx timeout=60s
package stdx_url_parse_example

import stdx.encoding.url.*

main(): Unit {
    let parsed = URL.parse("https://example.com/a%20b?q=cangjie")
    println(parsed.path)
    println(parsed.rawPath)

    let base = URL.parse("https://example.com/docs/api/")
    let resolved = base.resolveURL(URL.parse("../guide?lang=cj"))
    println(resolved)
}
```

预期标准输出：

```text cjtest=expect for=examples.network.url-parse.api.stdx.url.parse.run stream=stdout match=exact
/a b
/a%20b
https://example.com/docs/guide?lang=cj
```
