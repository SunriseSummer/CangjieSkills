<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.rune.compare" parent="std.core.intrinsic.rune.extension.extend-rune-comparable-rune" -->
# Rune.compare

[← extend Rune <: Comparable<Rune>](extensions/extend-rune-comparable-rune.md)

## 签名

```cangjie role=signature
public func compare(rhs: Rune): Ordering
```

判断当前 Rune 实例与指定 Rune 实例的大小关系。

## 契约

Rune 的大小关系指的是它们对应的 unicode 码点的大小关系。

参数：

- rhs: Rune - 待比较的另一个 Rune 实例。

返回值：

- Ordering - 如果大于，返回 Ordering.GT；如果等于，返回 Ordering.EQ；如果小于，返回 Ordering.LT。
