<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.unittestcase.create" parent="std.unittest.class.unittestcase" -->
# UnitTestCase.create

[← UnitTestCase](index.md)

## 签名

```cangjie role=signature
public static func create(
    name: String,
    configuration!: Configuration = Configuration(),
    body!: () -> Unit
): UnitTestCase
```

创建单元测试用例。

## 契约

参数：

- name: String - 用例名称。
- configuration!: Configuration - 用例配置信息。
- body!: () -> Unit - 用例执行体。

返回值：

- UnitTestCase - 单元测试用例对象。
