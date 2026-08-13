<!-- cj-doc kind="api-member" level="5" id="std.unittest.testmacro.macro.unittestoption" parent="std.unittest.testmacro" -->
# @UnittestOption

[← std.unittest.testmacro](../index.md)

## 签名

```cangjie role=signature
@UnittestOption
```

该宏可用于注册自定义配置项。

## 契约

该宏可用于注册自定义配置项。只有已注册的配置项才能与单元测试框架一起使用。宏的参数是**类型**、**选项名称**、可选的**验证器回调**和**可选的描述**。
对所有单元测试配置项的严格检查保证了控制台输入和源代码的正确性。它可以防止笔误和使用错误类型的值。
