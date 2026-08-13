<!-- cj-doc kind="example-leaf" level="4" id="examples.failure.option-navigation" parent="examples.failure" -->
# 用 Option 问号操作符安全导航

[← 可选值、异常与资源管理](index.md)

用 `?.` 在 Some 时继续读取成员、在 None 时短路，再以 `??` 提供同类型默认值。

## 已验证示例

安全访问在 `Some` 时继续读取成员，在 `None` 时返回新的 `None`；随后可用 `??` 提供同类型默认值。

```cangjie cjtest=run id=examples.failure.option-navigation.language.option-safe-navigation.run form=unit timeout=20s
package option_safe_navigation_example

class Profile {
    let nickname: String

    public init(nickname: String) {
        this.nickname = nickname
    }
}

func findProfile(found: Bool): ?Profile {
    if (found) {
        Some(Profile("Ada"))
    } else {
        None
    }
}

main(): Unit {
    println(findProfile(true)?.nickname ?? "guest")
    println(findProfile(false)?.nickname ?? "guest")
}
```

预期标准输出：

```text cjtest=expect for=examples.failure.option-navigation.language.option-safe-navigation.run stream=stdout match=exact
Ada
guest
```
