<!-- cj-doc kind="guide-leaf" level="5" id="language.basic_data_type.9-数组类型.9-2-varray-值类型" parent="language.basic_data_type.9-数组类型" -->
# 9.2 VArray\<T, $N\>（值类型）

[← 9. 数组类型](index.md)

- 值类型固定长度数组：`VArray<T, $N>`
- `$N` 为字面量 `Int64` 长度；`<T, $N>` 不可省略
- **限制**：元素类型 `T` 不能包含引用类型、枚举、lambda（`CFunc` 除外）或未实例化的泛型
- 字面量初始化：`var a: VArray<Int64, $3> = [1, 2, 3]`
- 构造方式：
  - `VArray<Int64, $5>({i => i})` — lambda 初始化
  - `VArray<Int64, $5>(repeat: 0)` — 重复初始化
- `a[i]` 访问/修改；`.size` 获取长度
- 比 `Array` 的 GC 压力小，但赋值时复制（避免在性能敏感代码中使用大型 VArray）
- 支持 C 互操作

---
