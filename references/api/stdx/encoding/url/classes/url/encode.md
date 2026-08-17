<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.url.class.url.encode" parent="stdx.encoding.url.class.url" -->
# URL.encode

[← URL](index.md)

## 签名

```cangjie role=signature
static func encode(url: String): String
```

对普通字符串进行 `URL` 编码（也称为 `%` 编码）。`URL` 编码的目的是将字符串中的特殊字符、非 `ASCII` 字符等转换为符合 `URL` 规范的格式，以确保这些字符串能在 `URL` 中安全地传输和使用。

## 注意
>
该函数编码所有字符，但部分字符被 `URL` 语法所保留，所以以下字符将不会被编码：
>
`0-9` `A-Z` `a-z`
>
`!` `'` `-` `.` `*` `(` `)` `_` `~`
>
`#` `$` `&` `+` `,` `/` `:` `;` `=` `?` `@`

## 参数

- url: String - 待编码的字符串。

## 返回值

- String - 编码后的字符串。

