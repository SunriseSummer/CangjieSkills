<!-- cj-doc kind="api-member" level="6" id="std.core.struct.array.flatmap" parent="std.core.struct.array" -->
# Array<T>.flatMap

[← Array<T>](index.md)

## 签名

```cangjie role=signature
public func flatMap<R>(transform: (T) -> Array<R>): Array<R>
```

对数组中的每个元素应用一个转换闭包（transform），该闭包返回一个数组，然后将所有返回的数组“压平”（flatten）并连接成一个单一的结果数组。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- transform: (T) -> Array<R> - 给定的映射函数。

## 返回值

- Array<R> -  被“映射（map）”和“压平（flatten）”后的新数组

