<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraylist.add" parent="std.collection.class.arraylist" -->
# ArrayList<T>.add

[← ArrayList<T>](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func add(Collection<T>)

### 签名

```cangjie role=signature
public func add(all!: Collection<T>): Unit
```

将指定集合中的所有元素附加到此 ArrayList 的末尾。

### 契约

函数会按照迭代器顺序遍历入参中的集合，并且将所有元素插入到此 ArrayList 的尾部。

参数：

- all!: Collection\<T> - 需要插入的元素的集合。

## func add(Collection<T>, Int64)

### 签名

```cangjie role=signature
public func add(all!: Collection<T>, at!: Int64): Unit
```

从指定位置开始，将指定集合中的所有元素插入此 ArrayList。

### 契约

函数会按照迭代器顺序遍历入参中的集合，并且将所有元素插入到指定位置，原先在指定位置及其后的元素会后移。

参数：

- all!: Collection\<T> - 要插入的 T 类型元素集合。
- at!: Int64 - 插入集合的目标索引。

异常：

- IndexOutOfBoundsException - 当 at 超出范围时，抛出异常。

## func add(T)

### 签名

```cangjie role=signature
public func add(element: T): Unit
```

将指定的元素附加到此 ArrayList 的末尾。

### 契约

参数：

- element: T - 插入的元素，类型为 T。

## func add(T, Int64)

### 签名

```cangjie role=signature
public func add(element: T, at!: Int64): Unit
```

在此 ArrayList 中的指定位置插入指定元素。

### 契约

参数：

- element: T - 要插入的 T 类型元素。
- at!: Int64 - 插入元素的目标索引。

异常：

- IndexOutOfBoundsException - 当 at 超出范围时，抛出异常。

## 已验证示例

```cangjie cjtest=compile id=api.arraylist.add.compile form=unit timeout=30s
package arraylist_add_compile

import std.collection.*

main(): Unit {
    let values = ArrayList<Int64>([2])
    values.add(1, at: 0)
}
```
