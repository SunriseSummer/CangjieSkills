<!-- cj-doc kind="api-member" level="5" id="std.core.func.max-t-t-t-array-t-where-t-comparable-t" parent="std.core" -->
# max<T>(T, T, Array<T>) where T <: Comparable<T>

[← std.core](../index.md)

## 签名

```cangjie role=signature
public func max<T>(a: T, b: T, others: Array<T>): T where T <: Comparable<T>
```

根据 T 类型的 Comparable 接口实现，返回一组数据中的最大值，由于此函数的第三个参数是一个变长参数，支持获取二个以上的数据的比较。

## 契约

> **注意：**
>
> 浮点数类型的比较也将按照 Comparable 的结果进行比较，如果浮点书中有非数 `NaN`，结果将不正确，此时建议使用 Float16、Float32、Float64 的 `static func max`方法。

参数：

- a: T - 第一个待比较的数。
- b: T - 第二个待比较的数。
- others: Array\<T> - 其他待比较的数。

返回值：

- T - 返回参数中的最大值。
