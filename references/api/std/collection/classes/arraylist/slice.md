<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraylist.slice" parent="std.collection.class.arraylist" -->
# ArrayList<T>.slice

[← ArrayList<T>](index.md)

## 签名

```cangjie role=signature
public func slice(range: Range<Int64>): ArrayList<T>
```

以传入参数 range 作为索引，返回索引对应的 ArrayList<T>。

## 契约

> **注意：**
>
> 如果参数 range 是使用 Range 构造函数构造的 Range 实例，有如下行为：
>
> 1. start 的值就是构造函数传入的值本身，不受构造时传入的 hasStart 的值的影响。
> 2. hasEnd 为 false 时，end 值不生效，且不受构造时传入的 isClosed 的值的影响，该数组切片取到原数组最后一个元素。

参数：

- range: Range\<Int64> - 传递切片的范围。

返回值：

- ArrayList\<T> - 切片所得的数组。

异常：

- IllegalArgumentException - 当 range.step 不等于 1 时，抛出异常。
- IndexOutOfBoundsException - 当 range 无效时，抛出异常。
