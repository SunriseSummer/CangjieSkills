# 源文件目录增量开发

仓颉 `1.1.3 (cjnative)` 可执行包 `source_catalog_increment` 已有一个只保存路径的目录模型。请在现有多文件工程中增量实现递归扫描、扩展名过滤、内容正则筛选、确定性排序和统计；仅使用标准库，不得重建替代工程。

## 保留并扩展公开 API

```cangjie
public struct SourceEntry {
    public let relativePath: String
    public let bytes: Int64
    public init(relativePath: String, bytes: Int64)
}

public class SourceCatalogException <: Exception {
    public init(message: String)
}

public class SourceCatalog {
    public init(root: Path)
    public func addExtension(extension: String): Unit
    public func clearExtensions(): Unit
    public func scan(): Array<SourceEntry>
    public func matching(pattern: String): Array<SourceEntry>
    public func totalBytes(): Int64
    public func render(): String
}
```

## 行为

- 构造参数必须是已存在目录；文件或不存在路径抛 `SourceCatalogException`。
- `addExtension` 接受 `cj` 或 `.cj`，忽略 ASCII 大小写和首尾 ASCII 空白；空扩展名抛异常；重复添加无影响。
- 未配置扩展名时扫描全部普通文件；配置后只保留匹配扩展名的普通文件。
- `scan()` 递归遍历所有子目录，返回相对 root 的路径，分隔符统一为 `/`，按相对路径升序排列；不把目录加入结果。
- `matching(pattern)` 在当前过滤规则下扫描文件，把文件完整字节按 UTF-8 解码，只返回内容被 `Regex(pattern)` 匹配的条目，并保持路径升序；非法正则统一转换为 `SourceCatalogException`。
- `totalBytes()` 和 `render()` 基于一次新的 `scan()`；render 每项为 `relativePath:bytes`，按换行连接，无项目时为空串。
- `scan()`、`matching()` 返回独立数组，后续文件系统变化或调用者修改数组不得改变之前的返回值。

`main()` 自行创建临时目录和三个文件：`a.cj` 内容为 `func main`、`nested/b.cj` 内容为 `class B`、`notes.txt` 内容为 `ignore`，只选择 `.cj`，并输出：

```text
a.cj:9
nested/b.cj:7
total=16
classes=1
```

把随题 `source_catalog_test.cj` 原样放入 `src/`。验收要求 `cjpm clean/build/test/run` 全部成功且编译 warning 为 0。
