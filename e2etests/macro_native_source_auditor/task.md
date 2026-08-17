# 任务：`macro_native_source_auditor`

用仓颉 `1.1.3 (cjnative)` 在 **Windows x64** 上实现一个 **仓颉源码审计器** workspace。
审计器读取一组仓颉样例源文件，用 `std.ast` 解析并统计声明、用正则抽取遗留标记、
通过 C 动态库计算摘要，最后按规则集产出一份**完全确定**的文本报告。

实现放在 `oracle/`。`frozen/` 下的测试与固件**已冻结**，实现必须适配它们，不得修改。

---

## 0. 硬性约束

| 项 | 要求 |
|---|---|
| 工具链 | `cjc`/`cjpm` **1.1.3**，`cjnative`，`x86_64-w64-mingw32` |
| 平台 | Windows x64（本任务不要求跨平台产物） |
| 依赖 | **仅** `std.*`；不使用 `stdx`、不访问公网 |
| 确定性 | 不依赖时间、随机数、环境变量、目录遍历顺序、反射集合顺序 |
| 告警 | `cjpm build` / `cjpm test` 输出 **0 条 warning** |
| 自包含 | C 源码随仓库提供，用 `clang` 就地构建 |

---

## 1. 工程形态

`oracle/` 必须是一个 **cjpm workspace**，含三个成员模块：

```
oracle/
├── cjpm.toml                 # [workspace] members = ["macros", "core", "app"]
├── macros/                   # 宏包模块（--compile-macro, output-type = "static"）
│   ├── cjpm.toml
│   └── src/auditor_macros.cj
├── core/                     # 库模块（static），根包 + 5 个子包
│   ├── cjpm.toml             # 含 [ffi.c]
│   └── src/
│       ├── auditor_core.cj   # 根包：public import 门面
│       ├── model/            # auditor_core.model
│       ├── native/           # auditor_core.native
│       ├── syntax/           # auditor_core.syntax
│       ├── rules/            # auditor_core.rules
│       └── scan/             # auditor_core.scan
├── app/                      # 可执行模块
│   ├── cjpm.toml
│   └── src/main.cj
├── native/auditor_native.c   # C 源码
├── libs/                     # 构建产出的动态库（见 §3）
└── fixtures/                 # 由 accept.py 从 frozen/fixtures 拷入
```

模块名固定：`auditor_macros`、`auditor_core`、`auditor_app`。

---

## 2. 宏包 `auditor_macros`

必须是独立 `macro package`，`compile-option = "--compile-macro"`，`output-type = "static"`。

### 2.1 属性宏 `@Rule`

```cangjie
public macro Rule(attr: Tokens, input: Tokens): Tokens
```

用法（作用于 `class` 声明）：

```cangjie
@Rule["R.NAM.01", Warn, 2]
public class NamingRule <: Analyzer<SourceUnit> { ... }
```

- `attr` 为 5 个 Token：`STRING_LITERAL , IDENTIFIER , INTEGER_LITERAL`
- 宏必须把 `input` 解析为 `ClassDecl`，向 `body.decls` **注入**三个成员，再返回 `toTokens()`：

```cangjie
public func code(): String      // 字符串字面量，取自 attr[0]
public func severity(): Severity // Severity.<attr[2]>
public func weight(): Int64      // 取自 attr[4]
```

- `attr.size != 5` 时用 `diagReport(DiagReportLevel.ERROR, ...)` 报错。
- 注入必须经由 `quote` 插值 + `parseDecl` 构造 `Decl` 节点。

### 2.2 声明宏 `@LexCount`

```cangjie
public macro LexCount(input: Tokens): Tokens
```

对 `input[0]` 的字符串字面量在**展开期**执行 `cangjieLex`，返回其 Token 数量的整数字面量。
`@LexCount("a b c d e f")` 展开为 `6`。用于在编译期推导 §5.4 的声明预算。

---

## 3. C 动态库

`oracle/native/auditor_native.c` 导出以下符号（Windows 下需 `__declspec(dllexport)`）：

```c
int64_t auditor_abi_version(void);                                            // 恒为 10005
int64_t auditor_digest(const uint8_t* data, int64_t length);                  // = auditor_digest_update(0, ...)
int64_t auditor_digest_update(int64_t state, const uint8_t* data, int64_t n); // h = (h*131 + b) % 1000000007
int64_t auditor_count_byte(const uint8_t* data, int64_t length, uint8_t t);
int64_t auditor_scale(int64_t* values, int64_t length, int64_t factor);       // 原地乘 factor，返回累加和
```

摘要算法（对每个字节，初值取 `state`）：`h = (h * 131 + b) % 1000000007`。

构建（`quality.py` / `accept.py` 自动执行）：

```shell
clang -shared -fstack-protector-all native/auditor_native.c -o libs/libauditor_native.dll
```

> Windows 上 cjpm 链接期需要 `libauditor_native.dll`，运行期需要 **无 `lib` 前缀** 的 `auditor_native.dll`；
> `accept.py` 会生成所需别名并配置子进程环境；直接启动构建产物时，该 DLL 须与 `.exe` 同目录或在 `PATH` 上。

`core/cjpm.toml` 用 `[ffi.c] auditor_native = { path = "../libs/" }` 配置；
`app` 无需重复配置（链接由声明 `foreign` 的成员携带）。

---

## 4. 公开 API 契约

冻结测试直接依赖以下签名，**不得更改名称、参数与返回类型**。

### 4.1 `auditor_core.model`

```cangjie
public enum Severity {
    | Info
    | Warn
    | Fatal
    public func label(): String   // "info" | "warn" | "fatal"
    public func rank(): Int64     // 0 | 1 | 2
}

public struct Finding {
    public let code: String
    public let path: String
    public let symbol: String
    public let severity: Severity
    public let message: String
    public init(code: String, path: String, symbol: String, severity: Severity, message: String)
    public func render(): String  // "<label>|<code>|<path>|<symbol>|<message>"
}

public interface Analyzer<T> {
    func id(): String
    func analyze(unit: T): Array<Finding>
}

public interface Summarizable {
    func summary(): String
}

extend Array<Finding> <: Summarizable   // "total=<n>,fatal=<n>,warn=<n>,info=<n>"

public class FindingSet {
    public init(items: Array<Finding>)
    public prop size: Int64
    public operator func [](index: Int64): Finding   // 越界抛 AuditException
    public func sorted(): FindingSet                 // 按 (code, path, symbol) 升序
    public func filter(minimum: Severity): FindingSet // 保留 rank() >= minimum.rank()
    public func codes(): Array<String>
    public func weight(): Int64                      // 见 §5.5
    public func render(): String                     // 各项 render() 以 "\n" 连接
}

public class AuditException <: Exception {
    public init(message: String)
}
```

### 4.2 `auditor_core.native`

```cangjie
public func nativeAbiVersion(): Int64
public func nativeDigest(bytes: Array<UInt8>): Int64
public func nativeCountByte(bytes: Array<UInt8>, target: UInt8): Int64
public func nativeScale(values: Array<Int64>, factor: Int64): Int64   // 原地修改 values

public class NativeDigest <: Resource {
    public init()
    public func update(bytes: Array<UInt8>): Unit  // 已关闭时抛 AuditException
    public func value(): Int64                     // 已关闭时抛 AuditException
    public func isClosed(): Bool
    public func close(): Unit
}
```

所有数组传参必须在 `unsafe` 块中使用 `acquireArrayRawData` / `releaseArrayRawData`，且严格配对。

### 4.3 `auditor_core.syntax`

```cangjie
public struct SourceUnit {
    public let path: String
    public let text: String
    public init(path: String, text: String)
}

public class DeclarationIndex {
    public prop functions: Array<String>
    public prop variables: Array<String>
    public prop classes: Array<String>
    public func count(): Int64      // functions.size + variables.size + classes.size
}

public func indexSource(text: String): DeclarationIndex  // parseProgram(cangjieLex(text)) + Visitor
public func lexemeCount(text: String): Int64             // cangjieLex(text).size
public func identifierLexemes(text: String): Array<String> // kind == IDENTIFIER 的 value，保持出现顺序
```

- `indexSource` 必须用继承 `Visitor` 的类遍历，覆写 `visit(FuncDecl)`、`visit(VarDecl)`、`visit(ClassDecl)`；
  三个列表按**遍历出现顺序**保存。
- 解析失败必须转换成 `AuditException`（消息以 `parse failed: ` 开头）。

### 4.4 `auditor_core.rules`

```cangjie
@Annotation[target: [Type]]
public class RuleTag {
    public let id: String
    public let enabled: Bool
    public const init(id: String, enabled: Bool)
}

public class NamingRule <: Analyzer<SourceUnit>   // @RuleTag["naming",  true]  @Rule["R.NAM.01",  Warn,  2]
public class SizeRule   <: Analyzer<SourceUnit>   // @RuleTag["size",    true]  @Rule["R.SIZE.01", Fatal, 5]
public class TodoRule   <: Analyzer<SourceUnit>   // @RuleTag["todo",    true]  @Rule["R.TODO.01", Info,  1]
public class LegacyRule <: Analyzer<SourceUnit>   // @RuleTag["legacy", false]  @Rule["R.LEG.01",  Info,  1]

public func ruleRegistry(): Array<Analyzer<SourceUnit>>  // 仅 enabled，按 id() 升序
public func ruleCodes(): Array<String>                   // 仅 enabled，按 code() 升序
public func enabledRuleIds(): Array<String>              // 反射按注解筛选，升序
public func tagOf(ruleId: String): RuleTag               // 反射按名称查找；未知 id 抛 AuditException
public func declarationBudget(): Int64                   // 由 @LexCount 在编译期得出，值为 6
```

- `enabledRuleIds` / `tagOf` 必须走 `std.reflect`（`ClassTypeInfo` + `findAnnotation<RuleTag>()`），
  并且**排序后返回**，不得依赖反射集合的遍历顺序。
- `id()` 返回 `RuleTag.id`。

### 4.5 `auditor_core.scan`

```cangjie
public func listSourceFiles(root: String): Array<String>   // 仅 ".cj"，文件名升序；根不存在抛 AuditException
public func readSource(root: String, name: String): SourceUnit
public func loadUnits(root: String): Array<SourceUnit>
public func todoMarkers(text: String): Array<String>       // 正则 TODO\(([A-Z]+)\) 的捕获组，出现顺序
public func markerHistogram(units: Array<SourceUnit>): Array<(String, Int64)>  // 按标记名升序
public func auditAll(units: Array<SourceUnit>): FindingSet // 已排序
public func renderReport(root: String): String             // §5.6 报告
```

### 4.6 根包 `auditor_core`

用 `public import` 把 §4.1–§4.5 的公开符号重导出到根包（测试会 `import auditor_core.<name>`），并提供：

```cangjie
public func auditorVersion(): String   // "1.1.3"
public func auditorTarget(): String    // "windows-x64-cjnative"
```

### 4.7 `auditor_app`

```cangjie
main(argv: Array<String>): Int64
public func auditExitCode(findings: FindingSet): Int64   // 含 Fatal 返回 4，否则 0
```

| 情形 | stdout | 退出码 |
|---|---|---|
| `argv.size != 1` | `error usage: auditor <sources-dir>` | `2` |
| 根目录不存在 | `error missing-root <root>` | `3` |
| 正常且无 Fatal | 报告 | `0` |
| 正常且有 Fatal | 报告 | `4` |

> Windows 上 `cjpm run` 不透传非零退出码；断言退出码须直接启动 `target/release/bin/auditor_app.exe`。

---

## 5. 规则语义

以 `unit` 为 `SourceUnit`，`index = indexSource(unit.text)`。

### 5.1 R.NAM.01 — NamingRule（Warn，weight 2）
对 `index.functions` 中每个名字 `n`，若首字符不是 ASCII 小写字母，**或** `n` 含 `_`，
产出 `Finding("R.NAM.01", unit.path, n, Warn, "expected lowerCamelCase")`。

### 5.2 R.SIZE.01 — SizeRule（Fatal，weight 5）
若 `index.count() > declarationBudget()`（即 `> 6`），产出**一条**
`Finding("R.SIZE.01", unit.path, "unit", Fatal, "declaration budget exceeded")`。

### 5.3 R.TODO.01 — TodoRule（Info，weight 1）
对 `todoMarkers(unit.text)` 的每个标记 `t`，产出
`Finding("R.TODO.01", unit.path, t, Info, "unresolved marker")`。

### 5.4 R.LEG.01 — LegacyRule（Info，weight 1）
`@RuleTag["legacy", false]`，**永不进入** `ruleRegistry()`，因此不产生任何 finding。

### 5.5 权重
`FindingSet.weight()` = 各 finding 按 `code` 对应规则 `weight()` 求和：
`R.NAM.01`→2，`R.SIZE.01`→5，`R.TODO.01`→1，`R.LEG.01`→1。

### 5.6 报告格式

`renderReport(root)` 逐行输出（行尾 `\n`，末行也带 `\n`）：

```
auditor <version> <target>
abi <nativeAbiVersion()>
rules <ruleCodes() 以 "," 连接>
units <单元数>
unit <path> digest=<n> lex=<n> funcs=<n> vars=<n> classes=<n> decls=<n>     # 每个单元一行，path 升序
finding <finding.render()>                                                  # 每条一行，已排序
marker <tag>=<count>                                                        # 每个标记一行，tag 升序
summary total=<n> fatal=<n> warn=<n> info=<n> weight=<n>
```

`digest` 为 `nativeDigest(unit.text.toArray())`。

---

## 6. 冻结件

| 路径 | 说明 |
|---|---|
| `frozen/tests/*.cj` | 行为测试，由 `accept.py` 按 `frozen-hashes.json` 的 `mapping` 拷入 `oracle/` |
| `frozen/fixtures/native/auditor_native.c` | 已提供的 C 实现，由验收复制到 `oracle/native/`；禁止修改 |
| `frozen/fixtures/sources/` | 被审计的样例源（含一个必须被忽略的 `.txt`） |
| `frozen/fixtures/expected/report.txt` | 报告黄金输出 |
| `frozen-hashes.json` | 全部冻结件的 SHA256 + 拷贝映射 + 计数 |

`accept.py` 会在拷贝前后校验哈希；**任何冻结件被改动都会导致验收失败**。

---

## 7. 质量门禁（`quality.py`）

在**不改写 `oracle/**/src`** 的前提下：

1. 记录所有源文件 SHA256 → 运行 cjfmt → 复核 SHA256 未变；
2. `cjfmt -d <member>/src -o reports/formatted/<member>`，并断言
   **输入覆盖**（输出 `.cj` 相对路径集合 == 输入集合）与**产物非空**；
3. 断言格式化结果与源码**逐字节相同**（源码本身即 cjfmt 规范形态）；
4. `cjlint -f <member>/src -r csv -o reports/lint/<member>.csv`，断言 CSV 存在、表头正确、可解析；
5. **诊断严查**：捕获 cjfmt/cjlint 的输出，出现 `unknown start of token` / `error` / `Fail` 等模式即失败
   （工具可能返回 0 却跳过文件）；
6. 项目行（`SourceFile` 位于被审计 `src` 下）中 **MANDATORY 级别必须为 0**，
   SUGGESTIONS 级别必须落在显式白名单内；落在工具链自身（如 `std.ast\ffi.cj`）的行单独统计、不计入门禁；
7. `cjpm test --report-format xml --report-path reports/tests`，断言 XML 存在、
   `failures="0" errors="0"`，且用例总数 ≥ 28。

> 不使用 `cjcov`：Windows 上其长路径行为不稳定，本任务以 cjfmt/cjlint/test-XML 三类产物作为门禁。

---

## 8. 验收（`accept.py`）

依次执行并全部通过：

1. 校验 `frozen-hashes.json` 中每个冻结件的 SHA256；
2. 拷贝冻结测试与固件进 `oracle/`，再次校验；
3. `clang` 构建 C 动态库；
4. `cjpm clean`；
5. `cjpm build`，**断言 warning 数为 0**；
6. `cjpm test`，断言全部通过且用例数 ≥ 28；
7. `cjpm run --name auditor_app -- fixtures/sources` 冒烟通过；
8. 直接启动当前平台下 `target/release/bin/auditor_app` 对应的可执行文件：
   - `fixtures/sources` → stdout 与黄金报告逐字节一致（LF 归一后），退出码 `4`；
   - 无参 → 退出码 `2`；
   - 不存在的根 → 退出码 `3`；
9. 运行 `quality.py`，全部门禁通过。
