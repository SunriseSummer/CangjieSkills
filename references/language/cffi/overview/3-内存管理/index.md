<!-- cj-doc kind="guide-index" level="5" id="language.cffi.overview.3-内存管理" parent="language.cffi.overview" -->
# 3. 内存管理

[← 总览与通用规则](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [3.1 LibC 工具类](3-1-libc-工具类.md) | `LibC` 提供 C 互操作的内存分配和释放（所有方法均须在 `unsafe` 上下文中调用）。 |
| [3.2 CPointerResource 与 CStringResource](3-2-cpointerresource-与-cstringresource.md) | 使用 `try-with-resource` 语法自动管理内存，避免手动释放。 |
| [3.3 acquireArrayRawData / releaseArrayRawData](3-3-acquirearrayrawdata-releasearrayrawdata.md) | 注意： `acquireArrayRawData` 和 `releaseArrayRawData` 必须配对使用。 |
