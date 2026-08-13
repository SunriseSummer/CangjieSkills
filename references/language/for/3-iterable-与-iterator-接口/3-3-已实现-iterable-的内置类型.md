<!-- cj-doc kind="guide-leaf" level="5" id="language.for.3-iterable-与-iterator-接口.3-3-已实现-iterable-的内置类型" parent="language.for.3-iterable-与-iterator-接口" -->
# 3.3 已实现 Iterable 的内置类型

[← 3. Iterable 与 Iterator 接口](index.md)

速查`Range<T>`：`T`；`Array<T>`：`T`；`ArrayList<T>`：`T`；另含更多表项。

| 类型 | 元素类型 | 有序 |
|------|---------|:---:|
| `Range<T>` | `T` | ✅ |
| `Array<T>` | `T` | ✅ |
| `ArrayList<T>` | `T` | ✅ |
| `String` | `Byte`（UTF-8 字节） | ✅ |
| `HashMap<K, V>` | `(K, V)` | ❌ |
| `HashSet<T>` | `T` | ❌ |

---
