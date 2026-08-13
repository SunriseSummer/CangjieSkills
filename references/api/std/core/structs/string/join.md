<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.join" parent="std.core.struct.string" -->
# String.join

[← String](index.md)

## 签名

```cangjie role=signature
public static func join(strArray: Array<String>, delimiter!: String = String.empty): String
```

连接字符串列表中的所有字符串，以指定分隔符分隔。

## 契约

参数：

- strArray: Array\<String> - 需要被连接的字符串数组，当数组为空时，返回空字符串。
- delimiter!: String - 用于连接的中间字符串，其默认值为 String.empty。

返回值：

- String - 连接后的新字符串。

异常：

- IllegalArgumentException - 当试图构造长度超过 UInt32 的最大值 的字符串时，抛出异常。
