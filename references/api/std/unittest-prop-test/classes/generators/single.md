<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.class.generators.single" parent="std.unittest.prop_test.class.generators" -->
# Generators.single

[← Generators](index.md)

## 签名

```cangjie role=signature
public static func single<T>(value: T): Generator<T>
```

生成器始终返回同一个值。

## 契约

参数：

- value: T - 生成器返回的值。

返回值：

- Generator\<T> - 生成器。
