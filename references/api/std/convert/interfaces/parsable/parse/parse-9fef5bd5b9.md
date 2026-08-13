<!-- cj-doc kind="api-member" level="7" id="std.convert.interface.parsable.parse.parse-9fef5bd5b9" parent="std.convert.interface.parsable.parse" -->
# Parsable<T>.static func parse(String)

[← Parsable<T>.parse](index.md)

## 签名

```cangjie role=signature
public static func parse(data: String): Int64
```

将 Int64 类型字面量的字符串转换为 Int64 值。

适用扩展：[extend Int64 <: Parsable<Int64>](../extensions/extend-int64-parsable-int64.md)。

## 契约

参数：

- data: String - 要转换的字符串。

返回值：

- Int64 - 返回转换后 Int64 值。

异常：

- IllegalArgumentException - 当字符串为空，首位为 `+` ，转换失败，或转换后超出 Int64 范围，或字符串中含有无效的 UTF-8 字符时，抛出异常。

## 典型示例

`parse` 适合输入必须合法、失败应立即中止当前操作的场景；它接受负号，但首字符为 `+` 或内容越界时会抛出 `IllegalArgumentException`。需要把失败保留为值时，改用 `tryParse`。

```cangjie cjtest=run id=api.int64.parse.run form=unit timeout=20s
package int64_parse_example

import std.convert.*

main(): Unit {
    println(Int64.parse("-42"))

    try {
        Int64.parse("+42")
    } catch (_: IllegalArgumentException) {
        println("invalid integer")
    }
}
```

```text cjtest=expect for=api.int64.parse.run stream=stdout match=exact
-42
invalid integer
```
