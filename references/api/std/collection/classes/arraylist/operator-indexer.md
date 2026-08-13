<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraylist.operator-indexer" parent="std.collection.class.arraylist" -->
# ArrayList<T>.[]

[← ArrayList<T>](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## operator func \[](Int64)

### 签名

```cangjie role=signature
public operator func [](index: Int64): T
```

操作符重载 - get。

### 契约

参数：

- index: Int64 - 表示 get 接口的索引。

返回值：

- T - 索引位置的元素的值。

异常：

- IndexOutOfBoundsException - 当 index 超出范围时，抛出异常。

## operator func \[](Int64, T)

### 签名

```cangjie role=signature
public operator func [](index: Int64, value!: T): Unit
```

操作符重载，通过下标运算符用指定的元素替换此列表中指定位置的元素。

### 契约

参数：

- index: Int64 - 要设置的索引值。
- value!: T - 要设置的 T 类型的值。

异常：

- IndexOutOfBoundsException - 当 index 超出范围时，抛出异常。

## operator func \[](Range<Int64>)

### 签名

```cangjie role=signature
public operator func [](range: Range<Int64>): ArrayList<T>
```

运算符重载 - 切片。

### 契约

> **注意：**
>
> - 如果参数 range 是使用 Range 构造函数构造的 Range 实例，有如下行为：
>     - start 的值就是构造函数传入的值本身，不受构造时传入的 hasStart 的值的影响。
>     - hasEnd 为 false 时，end 值不生效，且不受构造时传入的 isClosed 的值的影响，数组切片取到原数组最后一个元素。
>
> - 切片操作返回的 ArrayList 为全新的对象，与原 ArrayList 无引用关系。

参数：

- range: Range\<Int64> - 传递切片的范围。

返回值：

- ArrayList\<T> - 切片所得的数组。

异常：

- IllegalArgumentException - 当 range.step 不等于 1 时，抛出异常。
- IndexOutOfBoundsException - 当 range 无效时，抛出异常。
