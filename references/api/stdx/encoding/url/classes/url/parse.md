<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.url.class.url.parse" parent="stdx.encoding.url.class.url" -->
# URL.parse

[← URL](index.md)

## 签名

```cangjie role=signature
public static func parse(rawUrl: String): URL
```

将原始 URL 字符串解析成 URL 对象。

## 契约

这个函数会将 URL 按照组件分解，然后分别进行解码并存储在相应的组件属性中，而 rawXXX (此处泛指前缀是 raw 的 URL 属性)属性部分存储的是原始值，不做编解码处理。

使用示例请参见URL 解析函数 parse 的使用。

> **注意：**
>
> 该函数可以解析 URL 中的用户名和密码（如果存在），这是符合 RFC 3986 协议的解析功能的，但是 RFC 3986 也明确指出，任何场景下，明文保存用户信息存在被泄露风险，所以建议不要在 URL 中明文保存用户信息。

参数：

- rawUrl: String - URL 字符串。

返回值：

- URL - 解析字符串得到的 URL 实例。

异常：

- UrlSyntaxException - 当 URL 字符串中包含非法字符时，抛出异常。
- IllegalArgumentException - 当被编码的字符不符合 `UTF-8` 的字节序列规则时，抛出异常。

## 典型示例

`URL.parse` 同时保留解码后的组件和 `rawXxx` 原始编码组件；相对引用可再交给 `resolveURL` 按 RFC 3986 与基础 URL 合并。

```cangjie cjtest=run id=api.stdx.url.parse.run form=unit requires=stdx timeout=60s
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

```text cjtest=expect for=api.stdx.url.parse.run stream=stdout match=exact
/a b
/a%20b
https://example.com/docs/guide?lang=cj
```
