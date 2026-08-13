<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.class.randomdataprovider.randomdataprovider-configuration" parent="std.unittest.prop_test.class.randomdataprovider" -->
# RandomDataProvider<T>.RandomDataProvider(Configuration)

[← RandomDataProvider<T>](index.md)

## 签名

```cangjie role=signature
public RandomDataProvider(private let configuration: Configuration)
```

构造一个随机数据提供者 RandomDataProvider 的对象。

## 契约

参数：

- configuration: Configuration - 配置对象，必须包含一个随机生成器，名称为 `random` ，类型为 random.Random。

异常：

- IllegalArgumentException - 当 configuration 不包含 random 实例时，抛出异常。
