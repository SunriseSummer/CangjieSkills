# 类型安全策略链

在仓颉 `1.1.3 (cjnative)` 中创建可执行包 `typed_policy_chain`，实现可组合的字符串策略以及保持插入顺序的泛型策略链。

实现应自然使用接口、抽象类、`override`、泛型 `where` 约束、携带参数的枚举、模式匹配、直接扩展、自定义 `Iterable/Iterator` 和下标运算符。不得通过 `Any`、类型字符串或硬编码测试数据绕过类型系统。

## 公开 API

```cangjie
public interface Described {
    prop description: String
}

public enum Verdict {
    | Accept(String)
    | Reject(String)
    | Skip
}

public abstract class Policy <: Described {
    public init(description: String)
    public prop description: String
    public func evaluate(input: String): Verdict
}

public class PrefixPolicy <: Policy {
    public init(description: String, prefix: String, accept!: Bool = true)
    public override func evaluate(input: String): Verdict
}

public class SizePolicy <: Policy {
    public init(description: String, minimum: Int64, maximum: Int64)
    public override func evaluate(input: String): Verdict
}

public class PolicyChain<T> <: Iterable<T> where T <: Policy {
    public init()
    public prop size: Int64
    public func add(policy: T): Unit
    public func iterator(): Iterator<T>
    public operator func [](index: Int64): T
    public operator func [](index: Int64, value!: T): Unit
}

public func descriptionsOf<T>(values: Iterable<T>): Array<String> where T <: Described
public func render(verdict: Verdict): String
```

在同一包中直接扩展 `String`，增加 `bracketed(): String`，返回方括号包围的字符串。`render` 必须借此生成 `accept:[原因]`、`reject:[原因]` 或 `skip`。

- `PrefixPolicy`：输入以指定前缀开头时，根据 `accept` 返回 `Accept("prefix:<前缀>")` 或 `Reject("prefix:<前缀>")`，否则返回 `Skip`。
- `SizePolicy`：输入的 `size` 在闭区间内返回 `Accept("size")`，否则返回 `Reject("size")`；构造时拒绝负数边界及 `minimum > maximum`，抛 `IllegalArgumentException`。
- `PolicyChain` 保持插入顺序；下标读写沿用集合的越界异常；替换元素不得改变 `size`。
- `descriptionsOf` 对任意满足约束的 `Iterable` 按迭代顺序返回新的描述数组。

把随题 `typed_policy_chain_test.cj` 原样放入 `src/`。`main()` 构造两个前缀策略并输出：

```text
policies=2
descriptions=api,admin
verdict=accept:[prefix:api/]
```

验收要求 `cjpm clean/build/test/run` 全部成功，28 项测试全部通过，编译 warning 为 0。
