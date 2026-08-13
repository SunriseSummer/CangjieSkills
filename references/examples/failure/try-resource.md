<!-- cj-doc kind="example-leaf" level="4" id="examples.failure.try-resource" parent="examples.failure" -->
# 在异常路径自动释放资源

[← 可选值、异常与资源管理](index.md)

实现 Resource 后使用 try(resource)，保证正常和异常路径都执行关闭。

## 已验证示例

离开 `try(resource)` 时先调用 `isClosed()`；若资源尚未关闭则调用 `close()`，即使代码块抛出异常也同样执行。

```cangjie cjtest=run id=examples.failure.try-resource.language.try-resource.run form=unit timeout=20s
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

预期标准输出：

```text cjtest=expect for=examples.failure.try-resource.language.try-resource.run stream=stdout match=exact
use
close
caught
```
