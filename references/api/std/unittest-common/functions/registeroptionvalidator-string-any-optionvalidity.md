<!-- cj-doc kind="api-member" level="5" id="std.unittest.common.func.registeroptionvalidator-string-any-optionvalidity" parent="std.unittest.common" -->
# registerOptionValidator(String, (Any) -> OptionValidity)

[← std.unittest.common](../index.md)

## 签名

```cangjie role=signature
public func registerOptionValidator(name: String, validator: (Any) -> OptionValidity): Unit
```

用于注册自定义选项验证器。

## 契约

功能：用于注册自定义选项验证器。大多数情况下，用户应该使用  @UnittestOption 宏，而不是直接使用这个函数。

参数：

- name: String - 选项名称。
- validator: (Any) -> OptionValidity - 检查选项是否合法的函数。
