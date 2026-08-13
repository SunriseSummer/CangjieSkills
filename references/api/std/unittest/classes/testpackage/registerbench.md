<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.testpackage.registerbench" parent="std.unittest.class.testpackage" -->
# TestPackage.registerBench

[← TestPackage](index.md)

## 签名

```cangjie role=signature
public func registerBench(bench: () -> Benchmark): Unit
```

注册性能用例。

## 契约

参数：

- bench: () -> Benchmark - 性能用例生成闭包。
