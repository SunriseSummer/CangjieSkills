<!-- cj-doc kind="api-member" level="6" id="std.core.struct.array.get" parent="std.core.struct.array" -->
# Array<T>.get

[← Array<T>](index.md)

## 签名

```cangjie role=signature
public func get(index: Int64): Option<T>
```

获取数组中下标 index 对应的元素。

## 契约

该函数结果将用 Option 封装，如果 index 越界，将返回 None。

也可以通过 [] 操作符获取数组指定下标的元素，该接口将在 index 越界时抛出异常。

参数：

- index: Int64 - 要获取的值的下标。

返回值：

- Option\<T> - 当前数组中下标 index 对应的值。
