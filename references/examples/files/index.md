<!-- cj-doc kind="example-category" level="3" id="examples.files" parent="examples" -->
# 文件与目录

[← 应用示例](../index.md)

以明确的字节边界读写文件，并用元数据递归遍历目录。

| 示例 | 教学目标 |
|---|---|
| [写入 UTF-8 文件](file-write.md) | 使用 String 路径重载把 UTF-8 字节写入文件，并明确覆盖行为。 |
| [读取 UTF-8 文件](file-read.md) | 使用 String 路径重载读取全部字节，再按 UTF-8 恢复文本。 |
| [递归遍历目录并筛选普通文件](recursive-directory-walk.md) | 递归消费 Directory.readFrom 的当前层结果，用 FileInfo 区分目录和普通文件，并稳定排序。 |
