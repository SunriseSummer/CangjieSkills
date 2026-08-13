<!-- cj-doc kind="api-member" level="5" id="std.unittest.mock.func.spy-t-t" parent="std.unittest.mock" -->
# spy<T>(T)

[← std.unittest.mock](../index.md)

## 签名

```cangjie role=signature
public func spy<T>(objectToSpyOn: T): T
```

创建类型 T 的 `spy object` （ `mock object` 的扩展，对象的成员拥有默认实现的“骨架”对象）。

## 契约

功能：创建类型 T 的 `spy object` （ `mock object` 的扩展，对象的成员拥有默认实现的“骨架”对象）。 这个对象包装了所传入的对象，并且默认情况下成员函数、属性或运算符重载函数实现为对这个传入的实例对象的对应成员函数、属性或运算符重载函数的调用。
可以通过 `@On` 重载这个对象的成员函数、属性或运算符重载函数的行为。

参数：

- objectToSpyOn: T - 传入实例对象，默认情况下，使用该对象的实现。

返回值：

- T - 类型 T 的 `spy object` 。
