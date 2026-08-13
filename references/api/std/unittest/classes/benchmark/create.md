<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.benchmark.create" parent="std.unittest.class.benchmark" -->
# Benchmark.create

[← Benchmark](index.md)

## 签名

```cangjie role=signature
public static func create(
    name: String,
    configuration!: Configuration = Configuration(),
    measurement!: Measurement = TimeNow(),
    body!: () -> Unit
): Benchmark
```

创建一个性能测试用例对象。

## 契约

参数：

- name: String - 用例名称。
- configuration!: Configuration - 用例配置信息。
- measurement: Measurement - 测量方法信息。
- body: () -> Unit - 用例执行体。

返回值：

- Benchmark - 性能测试用例对象。
