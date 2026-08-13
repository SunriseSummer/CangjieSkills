<!-- cj-doc kind="api-member" level="6" id="std.core.struct.array.concat" parent="std.core.struct.array" -->
# Array<T>.concat

[← Array<T>](index.md)

## 签名

```cangjie role=signature
public func concat(other: Array<T>): Array<T>
```

该函数将创建一个新的数组，数组内容是当前数组后面串联 other 指向的数组。

## 契约

参数：

- other: Array\<T> - 串联到当前数组末尾的数组。

返回值：

- Array\<T> - 串联得到的新数组。
