<!-- cj-doc kind="api-member" level="6" id="std.core.struct.array.skip" parent="std.core.struct.array" -->
# Array<T>.skip

[← Array<T>](index.md)

## 签名

```cangjie role=signature
public func skip(count: Int64): Array<T>
```

跳过特定个数元素并返回一个新数组。

当 count 小于等于 0 时，抛出异常。当 count 等于 0 时，相当没有跳过任何元素，返回包含源数组所有元素的新数组。当 count 大于 0 小于源数组的大小时，跳过前 count 个元素，返回包含剩下的元素的新数组。当 count 大于等于数组的大小时，返回空数组。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- count: Int64 - 要跳过的个数。

## 返回值

- Array<T> - 返回一个跳过指定数量元素的新数组。

## 异常

- IllegalArgumentException - 当 count < 0 时，抛出异常。

