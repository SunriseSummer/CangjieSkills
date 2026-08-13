<!-- cj-doc kind="api-member" level="6" id="std.core.struct.array.repeat" parent="std.core.struct.array" -->
# Array<T>.repeat

[← Array<T>](index.md)

## 签名

```cangjie role=signature
public func repeat(n: Int64): Array<T>
```

重复当前数组若干次，得到新数组。

## 契约

参数：

- n: Int64 - 重复次数。

返回值：

- Array\<T> - 重复当前数组 n 次得到的新数组。

异常：

- IllegalArgumentException - 参数 n 小于等于 0。
