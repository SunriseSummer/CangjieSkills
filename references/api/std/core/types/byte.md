<!-- cj-doc kind="api-member" level="5" id="std.core.type.byte" parent="std.core" -->
# Byte

[← std.core](../index.md)

## 签名

```cangjie role=signature
public type Byte = UInt8
```

`Byte` 是 `UInt8` 的类型别名；ASCII 字节优先写 `b'A'`，整数常量可写 `65u8`，运行期数值用 `UInt8(value)` 显式转换。

## 契约

推荐构造：

- `b'A'`：单个 ASCII 字节字面量，类型为 `Byte`/`UInt8`。
- `65u8`：带类型后缀的 `UInt8` 整数字面量。
- `UInt8(value)`：把运行期数值显式转换为字节；编译期可确定的越界会报编译错误，运行期溢出按当前整数溢出策略处理。

`Byte` 与 `UInt8` 是同一类型，不存在 `toByte()` 成员。文本与字节数组之间应在边界处使用明确的 UTF-8 编解码 API。

## 区分字节字面量与运行期转换

固定 ASCII 字符使用 `b'x'`，固定整数使用 `u8` 后缀；只有来源值在运行期才调用 `UInt8(value)`。`Byte` 是 `UInt8` 的别名，不需要也不存在额外的 `toByte()` 转换层。

```cangjie cjtest=run id=api.byte.literal-conversion.run form=unit timeout=20s
package byte_literal_conversion_example

main(): Unit {
    let separator: Byte = b'.'
    let lineFeed: Byte = 10u8
    let source: Int64 = 65
    let letter: Byte = UInt8(source)
    println("${separator}|${lineFeed}|${letter}")
}
```

```text cjtest=expect for=api.byte.literal-conversion.run stream=stdout match=exact
46|10|65
```
