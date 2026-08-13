<!-- cj-doc kind="api-member" level="5" id="std.unittest.prop_test.func.random-t-where-t-arbitrary-t" parent="std.unittest.prop_test" -->
# random<T>() where T <: Arbitrary<T>

[← std.unittest.prop_test](../index.md)

## 签名

```cangjie role=signature
public func random<T>(): RandomDataStrategy<T> where T <: Arbitrary<T>
```

该函数生成 T 类型的随机数据，其中 T 必须实现接口 Arbitrary<T> 。

## 契约

功能：该函数生成 T 类型的随机数据，其中 T 必须实现接口 Arbitrary\<T> 。该函数的返回值是参数化测试的一种参数源。

返回值：

- RandomDataStrategy\<T> - 使用随机数据生成的 RandomDataStrategy 接口的实例。
