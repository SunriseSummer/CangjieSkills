<!-- cj-doc kind="api-member" level="6" id="std.core.struct.array.splitat" parent="std.core.struct.array" -->
# Array<T>.splitAt

[← Array<T>](index.md)

## 签名

```cangjie role=signature
public func splitAt(mid: Int64): (Array<T>, Array<T>)
```

从指定位置 mid 处分割数组。

## 契约

得到的两个数组是原数组的切片，取值范围为 [0, mid), [mid, this.size)。

参数：

- mid: Int64 - 分割的位置，取值范围为 [0, this.size]。

返回值：

- (Array\<T>, Array\<T>) - 分割原数组得到的两个切片。

异常：

- IllegalArgumentException - mid 小于 0 或大于 this.size。
