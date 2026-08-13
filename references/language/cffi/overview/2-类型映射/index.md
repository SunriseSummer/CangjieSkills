<!-- cj-doc kind="guide-index" level="5" id="language.cffi.overview.2-类型映射" parent="language.cffi.overview" -->
# 2. 类型映射

[← 总览与通用规则](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [2.1 基本类型](2-1-基本类型.md) | 注意： C 的 `int`、`long` 等类型在不同平台大小不同，需自行指定对应仓颉类型。 |
| [2.2 @C struct 结构体](2-2-c-struct-结构体.md) | 成员类型须满足 `CType` 约束 |
| [2.3 CPointer\<T> 指针](2-3-cpointer-指针.md) | `CPointer<T>` 映射到 C 的 `T*` 类型，`T` 须满足 `CType` 约束。 |
| [2.4 VArray\<T, $N> 数组](2-4-varray-数组.md) | `VArray<T, $N>` 映射到 C 的 `T[N]`。 |
| [2.5 CString 字符串](2-5-cstring-字符串.md) | `CString` 对应 C 的 `char*` 字符串，由 `LibC.mallocCString()` 创建，使用后须通过 `LibC.free()` 释放。 |
| [2.6 sizeOf / alignOf](2-6-sizeof-alignof.md) | 获取 `CType` 类型的内存大小和对齐值（单位：字节）。 |
| [2.7 CType 接口](2-7-ctype-接口.md) | `CType` 是空接口，作为所有 C 互操作类型的父类型，用于泛型约束。 |
