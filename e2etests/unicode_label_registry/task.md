# Unicode 标签注册表

## 目标

使用仓颉 1.1.3 实现包 `unicode_label_registry`，提供按 Unicode 字符而不是 UTF-8 字节工作的标签规范化、标识符校验、分类统计和稳定去重。实现必须直接使用 `std.unicode.*`、`String.runes()`、`StringBuilder` 和 `std.collection`；禁止用正则表达式替代 Rune 分类。

将随题提供的 `unicode_label_registry_test.cj` 原样复制到项目 `src/`，测试不可修改。

## 公开 API

```cangjie
public struct LabelStats {
    public let letters: Int64
    public let numbers: Int64
    public let whitespace: Int64
    public let others: Int64
    public init(letters: Int64, numbers: Int64, whitespace: Int64, others: Int64)
}

public func canonicalizeLabel(text: String, casing!: CasingOption = CasingOption.Other): String
public func isIdentifier(text: String): Bool
public func analyzeLabel(text: String): LabelStats
public func deduplicateLabels(labels: Array<String>, casing!: CasingOption = CasingOption.Other): Array<String>
```

## 契约

- `canonicalizeLabel` 删除首尾 Unicode 空白，将内部一个或多个 Unicode 空白折叠为单个 ASCII 空格，再按 `CasingOption` 调用 Unicode 小写转换。它不做 NFC/NFKC 规范化。
- `isIdentifier` 要求至少一个 Rune；首 Rune 必须是 Unicode letter，后续仅可为 letter、number 或 ASCII `_`。不自动 trim。
- `analyzeLabel` 按 Rune 计数，依次归类为 letter、number、whitespace、others；每个 Rune 只计入一类。
- `deduplicateLabels` 以规范化结果为键，忽略空键，保留每个键第一次出现的稳定顺序，返回规范化键。

## 工程与入口

`cjpm.toml` 使用包名 `unicode_label_registry`、`output-type = "executable"`。`main()` 对 `"  Alpha  Team "`、`"alpha\tteam"`、`"仓颉  语言"`、空白标签去重并输出：

```text
unique=2
first=alpha team
second=仓颉 语言
identifier=true
```

## 验收

依次执行 `cjpm clean`、`cjpm build`、`cjpm test`、`cjpm run`，均须成功，27 个确定性测试全部通过且 warning 为 0。
