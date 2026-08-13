<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.testgroup.builder" parent="std.unittest.class.testgroup" -->
# TestGroup.builder

[← TestGroup](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func builder(String)

### 签名

```cangjie role=signature
public static func builder(name: String): TestGroupBuilder
```

创建测试组合构造器。

### 契约

参数：

- name: String - 测试组合名称。

返回值：

- TestGroupBuilder - 测试组合构造器。

## static func builder(TestGroup)

### 签名

```cangjie role=signature
public static func builder(group: TestGroup): TestGroupBuilder
```

创建测试组合构造器。

### 契约

参数：

- group: TestGroup - 测试组合。

返回值：

- TestGroupBuilder - 测试组合构造器。
