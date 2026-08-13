<!-- cj-doc kind="guide-leaf" level="5" id="language.error_handle.2-抛出与处理异常.2-3-try-with-resources-表达式" parent="language.error_handle.2-抛出与处理异常" -->
# 2.3 `try-with-resources` 表达式

[← 2. 抛出与处理异常](index.md)

`try(resource)` 自动关闭实现 `Resource` 的对象，异常路径也会释放；整个表达式的类型始终是 `Unit`，需要返回数据时在块外保存结果。

用于**自动资源管理**。资源声明在 `try` 和 `{}` 之间。

### 关键规则
- `catch` 和 `finally` 块**可选**
- 资源须实现 **`Resource` 接口**：
  ```cangjie cjtest=syntax id=syntax-965de0a0a4-1 form=unit
  interface Resource {
      func isClosed(): Bool
      func close(): Unit
  }
  ```
- 多个资源用 `,` 分隔
- 资源变量作用域 = 体作用域
- try-with-resources 表达式的类型始终为 **`Unit`**

### 语法
```cangjie cjtest=syntax id=syntax-965de0a0a4-2 form=unit
class Worker <: Resource {
    let name: String
    var closed = false
    init(name: String) { this.name = name }
    func work() { println("${name} working") }
    public func isClosed(): Bool { closed }
    public func close(): Unit { closed = true; println("${name} closed") }
}

main() {
    try (r = Worker("Tom")) {
        r.work()
    }  // 若 r.isClosed() == false 则自动调用 r.close()
}
```

## 已验证示例

离开 `try(resource)` 时先调用 `isClosed()`；若资源尚未关闭则调用 `close()`，即使代码块抛出异常也同样执行。

```cangjie cjtest=run id=language.try-resource.run form=unit timeout=20s
package try_resource_example

class TrackedResource <: Resource {
    var closed = false

    public func use(): Unit {
        println("use")
    }

    public func isClosed(): Bool {
        return closed
    }

    public func close(): Unit {
        closed = true
        println("close")
    }
}

main(): Unit {
    try (resource = TrackedResource()) {
        resource.use()
        throw Exception("stop")
    } catch (_: Exception) {
        println("caught")
    }
}
```

```text cjtest=expect for=language.try-resource.run stream=stdout match=exact
use
close
caught
```
