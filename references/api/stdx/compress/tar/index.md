<!-- cj-doc kind="api-package" level="4" id="stdx.compress.tar" parent="api.stdx" -->
# stdx.compress.tar

[← stdx 包索引](../../index.md)

创建、提取和流式读写 tar 归档，并提供 V7、Ustar、PAX 与 GNU 条目模型。

包路径：`stdx.compress.tar`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`GnuTarEntry`](classes/gnutarentry/index.md) | 表示 Gnu tar 文件条目。 |
| [`PaxTarEntry`](classes/paxtarentry/index.md) | 表示 Pax tar 文件条目。 |
| [`PosixTarEntry`](classes/posixtarentry/index.md) | 表示含有 Ustar Gnu Pax 格式共有字段的 tar 文件条目。 |
| [`Tar`](classes/tar/index.md) | 归档和提取目录或流。 |
| [`TarEntry`](classes/tarentry/index.md) | 表示一个 tar 文件中的条目，用于和 TarReader 和 TarWriter 进行交互。可从 TarReader 中获取 TarEntry 实例，表示 tar 归档文件中的一个条目。也可通过 TarWriter 将其写入到 tar 归档文件中。 |
| [`TarReader`](classes/tarreader/index.md) | 从流中按照 tar 格式读取条目。 |
| [`TarWriter`](classes/tarwriter/index.md) | 将条目写入到流中，并完成 tar 文件的写入。 |
| [`UstarTarEntry`](classes/ustartarentry/index.md) | 表示 Ustar tar 文件条目。 |
| [`V7TarEntry`](classes/v7tarentry/index.md) | 表示 V7 tar 文件条目。 |
| [`TarException`](classes/tarexception/index.md) | tar 包的异常类。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`TarEntryFormat`](enums/tarentryformat/index.md) | tar 条目格式。 |
| [`TarEntryType`](enums/tarentrytype/index.md) | tar 条目类型。 |
