<!-- cj-doc kind="api-member" level="6" id="std.core.struct.array.map" parent="std.core.struct.array" -->
# Array<T>.map

[← Array<T>](index.md)

## 签名

```cangjie role=signature
public func map<R>(transform: (T)->R): Array<R>
```

将当前数组内所有 T 类型元素根据 transform 映射为 R 类型的元素，组成新的数组。

## 契约

参数：

- transform: (T)->R - 映射函数。

返回值：

- Array\<R> - 原数组中所有元素映射后得到的元素组成的新数组。
