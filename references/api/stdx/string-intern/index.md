<!-- cj-doc kind="api-package" level="4" id="stdx.string_intern" parent="api.stdx" -->
# stdx.string_intern

[← stdx 包索引](../index.md)

提供可配置的字符串驻留池；通过 `intern()` 复用等值 `String` 实例，降低大量重复字符串的内存占用。

包路径：`stdx.string_intern`。在代码中只导入实际使用的类型或函数。

## 接口

| 声明 | 功能 |
|---|---|
| [`Internable`](interfaces/internable/index.md) | 用来为 String 类型提供池化缓存扩展。 |
