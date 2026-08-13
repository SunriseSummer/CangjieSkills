# 任务 A：仓颉源码静态指标分析器

请在仓颉 `1.0.5 (cjnative)` 中实现一个名为 `source_metrics` 的 `cjpm` 可执行工程。程序接收内存中的仓颉源码字符串，使用 `std.ast` 完成解析和指标分析；不得通过正则表达式或逐行文本匹配伪造 AST 结果。

不可修改测试文件 `source_metrics_test.cj`。评测时会把该文件复制到工程的 `src` 目录，并执行 `cjpm clean`、`cjpm build`、`cjpm test`、`cjpm run`；四条命令都必须成功且编译器 warning 为 0。不得访问同级 `oracle` 目录，其中的参考工程只用于题目设计验证。

## 必须提供的公开 API

所有声明位于 `package source_metrics`。

```cangjie
public type NameList = ArrayList<String>

public enum DeclKind {
    | Function | Type | Variable | TypeAlias | Extension | Other
}

public interface DeclRule<T> {
    func seed(): T
    func measure(decl: Decl): T
    func combine(left: T, right: T): T
}

public class AnalysisException <: Exception {
    public init(message: String)
    public override func getClassName(): String
}

public class SourceMetrics {
    public var packageName: String
    public var importCount: Int64
    public var declarationCount: Int64
    public var publicDeclarationCount: Int64
    public var internalDeclarationCount: Int64
    public var protectedDeclarationCount: Int64
    public var privateDeclarationCount: Int64
    public var defaultDeclarationCount: Int64
    public var functionCount: Int64
    public var typeCount: Int64
    public var variableCount: Int64
    public var typeAliasCount: Int64
    public var extensionCount: Int64
    public var genericConstraintCount: Int64
    public var loopCount: Int64
    public var ifCount: Int64
    public var matchCount: Int64
    public var callCount: Int64
    public let recursiveFunctions: NameList
}

public func classify(decl: Decl): DeclKind
public func foldTopLevel<T>(source: String, rule: DeclRule<T>): T
public func analyzeSource(source: String): SourceMetrics
public func findRecursiveFunctions(source: String): NameList
```

## 行为契约

- 用 `cangjieLex` 与 `parseProgram` 解析完整源码，读取限定包名和导入数。
- `declarationCount` 统计遍历中遇到的函数、class/struct/interface/enum、变量、类型别名和扩展声明；函数参数不计作变量声明。
- `typeCount` 只统计 class、struct、interface、enum；`extensionCount` 单独统计扩展。
- 可见性计数适用于上述声明。显式 `public/internal/protected/private` 分别计数；没有这四种修饰符的声明计入 `defaultDeclarationCount`。
- `loopCount` 统计 `for-in`、`while`、`do-while`；`ifCount`、`matchCount`、`callCount` 分别统计对应 AST 节点。
- `genericConstraintCount` 统计 `where` 泛型约束节点。
- 递归函数只要求识别函数体中以同名简单引用直接调用自身的情况；结果按 AST 遍历顺序排列且名称不重复。普通调用和互递归不应误报为直接递归。
- `classify` 必须按声明的运行时节点类型分类；class/struct/interface/enum 都返回 `Type`。
- `foldTopLevel` 只折叠 `Program.decls`，按源码顺序调用规则；空输入从 `seed()` 返回。实现应使用递归完成折叠。
- 词法或语法解析失败统一抛 `AnalysisException("source cannot be parsed")`，其类名为 `AnalysisException`。
- `cjpm run` 的标准输出必须精确为 `demo:1` 加换行。

结果必须完全确定，不得依赖文件系统、网络、时钟、随机数或反射集合顺序。

