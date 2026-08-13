<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.runes" parent="std.core.struct.string" -->
# String.runes

[← String](index.md)

## 签名

```cangjie role=signature
public func runes(): Iterator<Rune>
```

获取字符串的 Rune 迭代器。

## 契约

返回值：

- Iterator\<Rune> - 字符串的 Rune 迭代器。

异常：

- IllegalArgumentException - 使用 `for-in` 或者 `next()` 方法遍历迭代器时，如果读取到非法字符，抛出异常。
