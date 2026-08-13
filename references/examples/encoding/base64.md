<!-- cj-doc kind="example-leaf" level="4" id="examples.encoding.base64" parent="examples.encoding" -->
# 在字节数组与 Base64 文本间往返

[← Base64 文本编码](index.md)

明确 UTF-8 边界，在原始字节和可传输文本表示之间编码与解码。

## 典型示例

编码函数接收原始字节；对文本编码时先取得 UTF-8 字节，解码后再用 `String.fromUtf8` 恢复字符串。

```cangjie cjtest=run id=examples.encoding.base64.api.stdx.base64.run form=unit requires=stdx timeout=60s
package stdx_base64_example

import stdx.encoding.base64.*

main(): Unit {
    let encoded = toBase64String("Cangjie".toArray())
    println(encoded)
    println(String.fromUtf8(fromBase64String(encoded).getOrThrow()))
}
```

预期标准输出：

```text cjtest=expect for=examples.encoding.base64.api.stdx.base64.run stream=stdout match=exact
Q2FuZ2ppZQ==
Cangjie
```
