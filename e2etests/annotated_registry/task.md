# 注解驱动的弱引用注册表

在仓颉 `1.1.3 (cjnative)` 中创建可执行包 `annotated_registry`。用自定义成员变量注解、`std.reflect.ClassTypeInfo`、`std.ref.WeakRef` 和 `HashMap` 建立可清理注册表。不得以硬编码字段名替代 describe 中的反射发现。

## 公开 API

```cangjie
@Annotation[target: [MemberVariable]]
public class ExternalKey {
    public let value: String
    public const init(value: String)
}

public class Profile {
    @ExternalKey["display_name"] public var name: String
    @ExternalKey["region"] public var region: String
    public var internalNote: String
    public init(name: String, region: String, internalNote!: String = "")
}

public class ProfileRegistry {
    public init()
    public func put(id: String, profile: Profile): Unit
    public func get(id: String): ?Profile
    public func clear(id: String): Unit
    public prop size: Int64
    public func liveIds(): Array<String>
    public func describe(id: String): ?String
}
```

id 必须非空。put 使用 `WeakRef<Profile>` 与 `CleanupPolicy.DEFERRED` 覆盖同名条目；get 对不存在或已清理引用返回 None；clear 对存在条目调用 WeakRef.clear，对未知 id 无操作。size 与 liveIds 只统计 value 为 Some 的条目，liveIds 自然升序。

describe 通过反射遍历实例成员变量，只输出带 ExternalKey 的 String 字段；读取注解 value 作为外部名，按外部名排序，格式为 `key=value`，以 `;` 连接。不得依赖反射成员集合顺序。未知或已清理 id 返回 None。

main 保持两个 Profile 强引用，清理其中一个，输出：

```text
ids=alpha,beta
alpha=display_name=Ada;region=EU
after=beta
```

把随题测试原样放入 `src/`；验收所有 cjpm 命令成功且 warning 为 0。
