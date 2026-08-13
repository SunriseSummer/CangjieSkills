<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.rune.next" parent="std.core.intrinsic.rune.extension.extend-rune-countable-rune" -->
# Rune.next

[← extend Rune <: Countable<Rune>](extensions/extend-rune-countable-rune.md)

## 签名

```cangjie role=signature
public func next(right: Int64): Rune
```

获取当前 Rune 值往右数 `right` 后所到位置的 Rune 值。

## 契约

参数：

- right: Int64 - 往右数的个数。

返回值：

- Rune - 往右数 `right` 后所到位置的 Rune 值。

异常：

- OverflowException - 如果与 Int64 数进行加法运算后为不合法的 Unicode 值，抛出异常。
