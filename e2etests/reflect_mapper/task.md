# 任务 B：注解与反射驱动的数据映射/校验器

请在仓颉 `1.1.3 (cjnative)` 中实现一个名为 `reflect_mapper` 的 `cjpm` 可执行工程。它把 `HashMap<String, String>` 映射到用户提供的 class 实例：字段是否参与映射、外部键名、必填和整数范围均由注解驱动；字段发现与赋值必须使用 `std.reflect`，不得为测试模型硬编码字段名。

不可修改测试文件 `reflect_mapper_test.cj`。评测时会把该文件复制到工程的 `src` 目录，并执行 `cjpm clean`、`cjpm build`、`cjpm test`、`cjpm run`；四条命令都必须成功且编译器 warning 为 0。不得访问同级 `oracle` 目录，其中的参考工程只用于题目设计验证。

## 必须提供的公开 API

所有声明位于 `package reflect_mapper`。

```cangjie
@Annotation[target: [MemberVariable]]
public class Mapped {
    public let key: String
    public let required: Bool
    public const init(key: String, required: Bool)
}

@Annotation[target: [MemberVariable]]
public class IntRange {
    public let minimum: Int64
    public let maximum: Int64
    public const init(minimum: Int64, maximum: Int64)
}

public interface TextDecoder<T> {
    func decode(text: String): T
}

public class StringDecoder <: TextDecoder<String>
public class Int64Decoder <: TextDecoder<Int64>
public class BoolDecoder <: TextDecoder<Bool>

public class DecoderRegistry {
    public init()
    public func register<T>(decoder: TextDecoder<T>): Unit
}

public class MappingIssue <: ToString {
    public let field: String
    public let code: String
    public let message: String
    public init(field: String, code: String, message: String)
    public func toString(): String
}

public interface ValidationState {
    prop isValid: Bool
}

public class MappingResult<T> {
    public let value: T
    public let issues: ArrayList<MappingIssue>
    public init(value: T, issues: ArrayList<MappingIssue>)
    public prop isValid: Bool
}

extend<T> MappingResult<T> <: ValidationState {}

public class MappingException <: Exception {
    public let issues: ArrayList<MappingIssue>
    public init(issues: ArrayList<MappingIssue>)
    public override func getClassName(): String
}

public class ReflectMapper<T> where T <: Object {
    public init(factory: () -> T, registry!: DecoderRegistry = DecoderRegistry())
    public func map(input: HashMap<String, String>): MappingResult<T>
    public func mapOrThrow(input: HashMap<String, String>): T
}
```

## 行为契约

- 每次映射先调用 `factory` 创建新实例，再通过 `ClassTypeInfo` 枚举当前 class 自身的 `public` 实例变量。
- 只处理带 `@Mapped[key, required]` 的字段；未注解字段和未知输入键忽略。键存在但值为空字符串仍视为“已提供”。
- 默认 registry 必须支持 String（原样）、Int64（十进制解析）和 Bool（只接受精确小写 `true`/`false`）。`register<T>` 可增加自定义字段类型解码器，且不能破坏默认解码器。
- 成功解码后用反射 `setValue` 写入字段；解码失败或无匹配解码器时不改默认值，并产生 `MappingIssue(key, "decode", "value cannot be decoded")`。
- 缺少 required 字段时产生 `MappingIssue(key, "missing", "required value is missing")`。
- `@IntRange[min, max]` 两端均包含；越界时不赋值，并产生 `MappingIssue(key, "range", "value is outside the accepted range")`。
- `map` 不因单个字段失败而抛异常，而是返回全部问题。反射字段集合的遍历顺序不稳定，因此必须先按实例变量声明名升序处理，使 `issues` 顺序确定。
- `mapOrThrow` 在无问题时返回值；有问题时抛 `MappingException`。异常 message 精确为 `mapping failed with N issue(s)`，类名为 `MappingException`。
- `MappingIssue.toString()` 精确为 `field:code:message`；`MappingResult.isValid` 当且仅当 `issues` 为空。必须用泛型接口扩展让任意 `MappingResult<T>` 满足 `ValidationState`。
- `cjpm run` 标准输出必须精确为 `Ada:true` 加换行。

结果必须完全确定，不得依赖文件系统、网络、时钟、随机数或反射集合的原始遍历顺序。
