<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.url.class.url.decode" parent="stdx.encoding.url.class.url" -->
# URL.decode

[← URL](index.md)

## 签名

```cangjie role=signature
static func decode(url: String): String
```

对经过 `URL` 编码（也就是 `%` 编码）的字符串进行解码操作，将编码后的字符串还原成原始的字符串。

## 注意
>
该函数解码所有被编码的字符，但部分字符是 URL 语法的一部分，所以以下字符将保留在输出字符串中：
>
`#` `$` `&` `+` `,` `/` `:` `;` `=` `?` `@`

## 参数

- url: String - 待解码的字符串。

## 返回值

- String - 解码后的字符串。

