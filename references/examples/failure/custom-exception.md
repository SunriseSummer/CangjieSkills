<!-- cj-doc kind="example-leaf" level="4" id="examples.failure.custom-exception" parent="examples.failure" -->
# 定义并报告应用异常

[← 可选值、异常与资源管理](index.md)

继承 Exception、初始化 message，并按需重写 getClassName 获得稳定类型名。

## 已验证示例

自定义异常继承 `Exception`，构造函数先用 `super(message)` 初始化消息。重写 `getClassName()` 不是编译要求，但可使异常的类型名输出正确。

```cangjie cjtest=run id=examples.failure.custom-exception.language.custom-exception.run form=unit timeout=20s
package custom_exception_example

class UndefinedVariableException <: Exception {
    public init(name: String) {
        super("undefined variable: ${name}")
    }

    public override func getClassName(): String {
        "UndefinedVariableException"
    }
}

main(): Unit {
    try {
        throw UndefinedVariableException("missing")
    } catch (error: UndefinedVariableException) {
        println("${error.getClassName()}: ${error.message}")
    }
}
```

预期标准输出：

```text cjtest=expect for=examples.failure.custom-exception.language.custom-exception.run stream=stdout match=exact
UndefinedVariableException: undefined variable: missing
```
