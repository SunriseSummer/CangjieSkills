<!-- cj-doc kind="guide-leaf" level="5" id="language.error_handle.2-抛出与处理异常.2-1-throw-关键字" parent="language.error_handle.2-抛出与处理异常" -->
# 2.1 `throw` 关键字

[← 2. 抛出与处理异常](index.md)

- `throw <expr>` 其中 `<expr>` 须为 `Exception` 子类型（不能抛出 `Error`）
- 未处理的异常调用默认处理器，或通过以下方式注册自定义处理器。


## 已验证示例

抛出可直接构造的标准异常，并按具体异常类型捕获；异常消息通过 `message` 属性读取。

```cangjie cjtest=run id=language.throw-exception.run form=unit timeout=20s
package throw_exception_example

func requirePositive(value: Int64): Unit {
    if (value <= 0) {
        throw IllegalArgumentException("value must be positive")
    }
}

main(): Unit {
    try {
        requirePositive(0)
    } catch (error: IllegalArgumentException) {
        println(error.message)
    }
}
```

```text cjtest=expect for=language.throw-exception.run stream=stdout match=exact
value must be positive
```
