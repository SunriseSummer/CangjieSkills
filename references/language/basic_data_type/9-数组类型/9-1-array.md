<!-- cj-doc kind="guide-leaf" level="5" id="language.basic_data_type.9-数组类型.9-1-array" parent="language.basic_data_type.9-数组类型" -->
# 9.1 Array\<T\>

[← 9. 数组类型](index.md)

- 有序、单元素类型集合，**固定长度**（不支持增删）
- `Array<T>` 是 **struct** 类型，但内部通过引用共享数据 — `let arr2 = arr1` 后两者共享底层存储，修改互相可见
- 字面量：`[e1, e2, ...]`；空数组：`[]`（需要类型上下文）
- 构造方式：
  - `Array<Int64>()` — 空数组
  - `Array<Int64>(3, repeat: 0)` — 3 个元素全为 0
  - `Array<Int64>(3, {i => i + 1})` — lambda 初始化
- 访问：`arr[i]`（`Int64` 索引，从 0 开始）；负数或越界 → 编译错误或运行时异常
- 切片：`arr[0..5]`、`arr[..3]`、`arr[2..]`（使用 Range）
- 修改：`arr[0] = 3`，元素可修改
- `.size` 属性获取元素数量
- 可用 `for (i in arr)` 迭代
