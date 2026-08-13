<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraylist.remove" parent="std.collection.class.arraylist" -->
# ArrayList<T>.remove

[← ArrayList<T>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func remove(Int64)

### 签名

```cangjie role=signature
public func remove(at!: Int64): T
```

删除此 ArrayList 中指定位置的元素。

### 契约

参数：

- at!: Int64 - 被删除元素的索引。

返回值：

- T - 被移除的元素。

异常：

- IndexOutOfBoundsException - 当 at 超出范围时，抛出异常。

## func remove(Range<Int64>)

### 签名

```cangjie role=signature
public func remove(range: Range<Int64>): Unit
```

删除此 ArrayList 中 Range 范围所包含的所有元素。

### 契约

> **注意：**
>
> 如果参数 range 是使用 Range 构造函数构造的 Range 实例，hasEnd 为 false 时，end 值不生效，且不受构造时传入的 isClosed 的值的影响，数组切片取到原数组最后一个元素。

参数：

- range: Range\<Int64> - 需要被删除的元素的范围。

异常：

- IllegalArgumentException - 当 range 的 step 不等于 1 时抛出异常。
- IndexOutOfBoundsException - 当 range 的 start 或 end 小于 0，或 end 大于 Array 的长度时抛出。
