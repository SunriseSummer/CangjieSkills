<!-- cj-doc kind="api-member" level="6" id="std.unittest.common.interface.dataprovider.provide" parent="std.unittest.common.interface.dataprovider" -->
# DataProvider.provide

[← DataProvider](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## func provide()

### 签名

```cangjie role=signature
func provide(): Iterable<T>
```

获取数据迭代器。

### 契约

返回值：

- Iterable\<T> - 数据迭代器。

## func provide()

适用扩展：[extend<T> Array<T> <: DataProvider<T>](extensions/extend-t-array-t-dataprovider-t.md)。

### 签名

```cangjie role=signature
public func provide(): Iterable<T>
```

获取数据迭代器。

### 契约

返回值：

- Iterable\<T> - 数据迭代器。

## func provide()

适用扩展：[extend<T> Range<T> <: DataProvider<T>](extensions/extend-t-range-t-dataprovider-t.md)。

### 签名

```cangjie role=signature
public func provide(): Iterable<T>
```

获取数据迭代器。

### 契约

返回值：

- Iterable\<T> - 数据迭代器。
