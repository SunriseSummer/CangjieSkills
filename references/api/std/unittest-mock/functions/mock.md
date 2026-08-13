<!-- cj-doc kind="api-member" level="5" id="std.unittest.mock.func.mock" parent="std.unittest.mock" -->
# mock

[← std.unittest.mock](../index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## mock<T>()

### 签名

```cangjie role=signature
public func mock<T>(): T
```

创建类型 T 的 `mock object`， 这个对象默认情况下，所有的成员函数、属性或运算符重载函数没有任何具体实现。

### 契约

功能：创建类型 T 的 `mock object`， 这个对象默认情况下，所有的成员函数、属性或运算符重载函数没有任何具体实现。
可以通过 `@On` 指定这个对象的成员函数、属性或运算符重载函数的行为。

返回值：

- T - 类型 T 的 `mock object` 。

## mock<T>(Array<StubMode>)

### 签名

```cangjie role=signature
public func mock<T>(modes: Array<StubMode>): T
```

创建类型 T 的 `mock object` ， 参数指定了桩的模式。

### 契约

参数：

- modes: Array\<StubMode> - 指定桩的模式，可以为多个。

返回值：

- T - 类型 T 的 `mock object` 。
