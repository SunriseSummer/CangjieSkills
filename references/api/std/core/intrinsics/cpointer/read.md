<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.cpointer.read" parent="std.core.intrinsic.cpointer.extension.extend-t-cpointer-t" -->
# CPointer<T>.read

[← extend<T> CPointer<T>](extensions/extend-t-cpointer-t.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func read()

### 签名

```cangjie role=signature
public unsafe func read(): T
```

读取第一个数据，该接口需要用户保证指针的合法性，否则发生未定义行为。

### 契约

返回值：

- T - 该对象类型的第一个数据。

## func read(Int64)

### 签名

```cangjie role=signature
public unsafe func read(idx: Int64): T
```

根据下标读取对应的数据，该接口需要用户保证指针的合法性，否则发生未定义行为。

### 契约

参数：

- idx: Int64 - 要获取数据的下标。

返回值：

- T - 输入下标对应的数据。
