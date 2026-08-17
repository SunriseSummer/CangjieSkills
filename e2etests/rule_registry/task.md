# 可组合规则注册表

在仓颉 `1.1.3 (cjnative)` 中创建可执行包 `rule_registry`。实现一组可组合文本规则，并以类型安全的注册表维护同类规则。

实现必须自然使用抽象类与抽象函数、`override`、只读 `prop`、泛型 `where` 约束、直接扩展、自定义 `Iterable/Iterator` 和 `operator func []`。不得用字符串类型码或 `Any` 规避多态。

## 公开 API

```cangjie
public interface Named {
    prop name: String
}

public enum Decision {
    | Allow(String)
    | Deny(String)
    | Abstain
}

public abstract class Rule <: Named {
    public init(name: String)
    public prop name: String
    public func decide(input: String): Decision
}

public class PrefixRule <: Rule {
    public init(name: String, prefix: String, allow!: Bool = true)
    public override func decide(input: String): Decision
}

public class LengthRule <: Rule {
    public init(name: String, minimum: Int64, maximum: Int64)
    public override func decide(input: String): Decision
}

public class RuleRegistry<T> <: Iterable<T> where T <: Rule {
    public init()
    public prop size: Int64
    public func add(rule: T): Unit
    public func iterator(): Iterator<T>
    public operator func [](index: Int64): T
    public operator func [](index: Int64, value!: T): Unit
}

public func namesOf<T>(values: Iterable<T>): Array<String> where T <: Named
public func render(decision: Decision): String
```

同包内为 `String` 增加 `quoted(): String` 扩展，返回双引号包围的字符串；`render` 必须用它生成 `allow:"reason"`、`deny:"reason"` 或 `abstain`。

`PrefixRule` 在输入以指定前缀开始时返回 Allow/Deny，否则 Abstain。`LengthRule` 对长度在闭区间内的输入返回 Allow(`length`)，区间外返回 Deny(`length`)，构造时拒绝负数或 `minimum > maximum`。注册表保持插入顺序，下标越界沿用集合异常。

把随题测试原样放入 `src/`。`main()` 构造两个前缀规则，输出：

```text
rules=2
names=api,admin
decision=allow:"prefix:api/"
```

验收：`cjpm clean`、`cjpm build`、`cjpm test`、`cjpm run` 全部成功，编译 warning 为 0。
