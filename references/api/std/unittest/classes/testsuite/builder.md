<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.testsuite.builder" parent="std.unittest.class.testsuite" -->
# TestSuite.builder

[← TestSuite](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func builder(String)

### 签名

```cangjie role=signature
public static func builder(name: String): TestSuiteBuilder
```

创建测试套构建器。

### 契约

参数：

- name: String - 测试套名称。

返回值：

- TestSuiteBuilder - 测试套构造器。

## static func builder(TestSuite)

### 签名

```cangjie role=signature
public static func builder(suite: TestSuite): TestSuiteBuilder
```

创建测试套构建器。

### 契约

参数：

- suite: TestSuite - 测试套。

返回值：

- TestSuiteBuilder - 测试套构造器。
