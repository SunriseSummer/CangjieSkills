<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.cpointer.write" parent="std.core.intrinsic.cpointer.extension.extend-t-cpointer-t" -->
# CPointer<T>.write

[← extend<T> CPointer<T>](extensions/extend-t-cpointer-t.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func write(Int64, T)

### 签名

```cangjie role=signature
public unsafe func write(idx: Int64, value: T): Unit
```

在指定下标位置写入一个数据，该接口需要用户保证指针的合法性，否则发生未定义行为。

### 契约

参数：

- idx: Int64 - 指定的下标位置。
- value: T - 写入的数据。

## func write(T)

### 签名

```cangjie role=signature
public unsafe func write(value: T): Unit
```

写入一个数据，该数据总是在第一个，该接口需要用户保证指针的合法性，否则发生未定义行为。

### 契约

参数：

- value: T - 要写入的数据。
