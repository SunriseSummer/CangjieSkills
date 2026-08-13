<!-- cj-doc kind="api-member" level="5" id="stdx.encoding.base64.func.tobase64string-array-byte" parent="stdx.encoding.base64" -->
# toBase64String(Array<Byte>)

[← stdx.encoding.base64](../index.md)

## 签名

```cangjie role=signature
public func toBase64String(data: Array<Byte>): String
```

此函数用于将 Byte 数组转换成 Base64 编码的字符串。

## 契约

参数：

- data: Array\<Byte> - 要编码的 Byte 数组。

返回值：

- String - 返回编码后的字符串。

## 典型示例

编码函数接收原始字节；对文本编码时先取得 UTF-8 字节，解码后再用 `String.fromUtf8` 恢复字符串。

```cangjie cjtest=run id=api.stdx.base64.run form=unit requires=stdx timeout=60s
package stdx_base64_example

import stdx.encoding.base64.*

main(): Unit {
    let encoded = toBase64String("Cangjie".toArray())
    println(encoded)
    println(String.fromUtf8(fromBase64String(encoded).getOrThrow()))
}
```

```text cjtest=expect for=api.stdx.base64.run stream=stdout match=exact
Q2FuZ2ppZQ==
Cangjie
```
