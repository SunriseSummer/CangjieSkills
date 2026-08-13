<!-- cj-doc kind="guide-leaf" level="5" id="language.string.4-静态方法.4-2-fromutf8-从-utf-8-字节数组构造" parent="language.string.4-静态方法" -->
# 4.2 `fromUtf8` — 从 UTF-8 字节数组构造

[← 4. 静态方法](index.md)

```cangjie cjtest=syntax id=syntax-3567db4b55-1 form=unit
static func fromUtf8(utf8Data: Array<UInt8>): String
```

- 校验字节数组是否为合法 UTF-8，非法则抛出 `IllegalArgumentException`

```cangjie cjtest=syntax id=syntax-3567db4b55-2 form=stmt
let bytes: Array<UInt8> = [72, 101, 108, 108, 111]
let s = String.fromUtf8(bytes) // "Hello"
```
