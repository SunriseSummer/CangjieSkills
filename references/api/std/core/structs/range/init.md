<!-- cj-doc kind="api-member" level="6" id="std.core.struct.range.init" parent="std.core.struct.range" -->
# Range<T> where T <: Countable<T> & Comparable<T> & Equatable<T>.init

[← Range<T> where T <: Countable<T> & Comparable<T> & Equatable<T>](index.md)

## 签名

```cangjie role=signature
public const init(start: T, end: T, step: Int64, hasStart: Bool, hasEnd: Bool, isClosed: Bool)
```

使用该构造函数创建 Range 序列。

## 契约

参数：

- start: T - 开始值。
- end: T - 结束值。
- step: Int64 - 步长，取值不能为 0。
- hasStart: Bool - 是否有开始值。
- hasEnd: Bool - 是否有结束值。
- isClosed: Bool - true 代表左闭右闭，false 代表左闭右开。

异常：

- IllegalArgumentException - 当 step 等于 0 时，抛出异常。
