<!-- cj-doc kind="example-leaf" level="4" id="examples.binary.byte-literal-conversion" parent="examples.binary" -->
# 选择字节字面量或数值转换

[← 字节缓冲与端序](index.md)

固定 ASCII 用 b'x'，固定整数用 u8 后缀，运行期数值才调用 UInt8(value)；Byte 与 UInt8 是同一类型。

## 区分字节字面量与运行期转换

固定 ASCII 字符使用 `b'x'`，固定整数使用 `u8` 后缀；只有来源值在运行期才调用 `UInt8(value)`。`Byte` 是 `UInt8` 的别名，不需要也不存在额外的 `toByte()` 转换层。

```cangjie cjtest=run id=examples.binary.byte-literal-conversion.api.byte.literal-conversion.run form=unit timeout=20s
package byte_literal_conversion_example

main(): Unit {
    let separator: Byte = b'.'
    let lineFeed: Byte = 10u8
    let source: Int64 = 65
    let letter: Byte = UInt8(source)
    println("${separator}|${lineFeed}|${letter}")
}
```

预期标准输出：

```text cjtest=expect for=examples.binary.byte-literal-conversion.api.byte.literal-conversion.run stream=stdout match=exact
46|10|65
```
