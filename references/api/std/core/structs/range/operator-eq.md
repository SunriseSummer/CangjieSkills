<!-- cj-doc kind="api-member" level="7" id="std.core.struct.range.operator-eq" parent="std.core.struct.range.extension.extend-t-range-t-equatable-range-t-where-t-countable-t-comparab-c0ddba7b" -->
# Range<T> where T <: Countable<T> & Comparable<T> & Equatable<T>.==

[← extend<T> Range<T> <: Equatable<Range<T>> where T <: Countable<T> & Comparable<T> & Equatable<T>](extensions/extend-t-range-t-equatable-range-t-where-t-countable-t-comparab-c0ddba7b.md)

## 签名

```cangjie role=signature
public operator func ==(that: Range<T>): Bool
```

判断两个 Range 实例是否相等。

## 契约

两个 Range 实例相等指的是它们表示同一个区间，即 `start`、`end`、step、`isClosed` 值相等。

参数：

- that: Range\<T> - 待比较的 Range 实例。

返回值：

- Bool - true 代表相等，false 代表不相等。
