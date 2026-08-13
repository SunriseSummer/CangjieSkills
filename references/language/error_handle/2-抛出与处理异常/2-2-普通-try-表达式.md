<!-- cj-doc kind="guide-leaf" level="5" id="language.error_handle.2-抛出与处理异常.2-2-普通-try-表达式" parent="language.error_handle.2-抛出与处理异常" -->
# 2.2 普通 `try` 表达式

[← 2. 抛出与处理异常](index.md)

三个块：**try**、**catch**（0+）、**finally**（有 catch 时可选，无 catch 时须有）

### 语法示例
```cangjie cjtest=syntax id=syntax-1e1fab44bb-1 form=stmt
try {
    throw NegativeArraySizeException("error!")
} catch (e: NegativeArraySizeException) {
    println(e)
} catch (e: IllegalArgumentException | ArithmeticException) {
    println("Other exception: ${e}")
} catch (_) {
    println("Unknown exception")
} finally {
    println("cleanup")
}
```

### 规则
- `try` 块：包含可能抛出异常的代码。定义独立作用域
- `catch` 块：使用 **catchPattern** 通过模式匹配捕获异常。首个匹配的 catch 执行；后续 catch 被跳过。编译器在 catch 不可达（被前面的 catch 遮蔽）时发出警告
- `finally` 块：无论是否有异常始终执行。用于清理。避免在 finally 中抛出异常。即使异常未被捕获也会执行（然后重新抛出）
- 每个 `try`/`catch` 块有**独立作用域**

### try 表达式类型
- try 块 + 所有 catch 块的最小公共父类型（**不包括** finally）
- 若 try 表达式的值未使用，类型为 `Unit`
