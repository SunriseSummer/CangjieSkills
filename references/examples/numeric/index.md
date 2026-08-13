<!-- cj-doc kind="example-category" level="3" id="examples.numeric" parent="examples" -->
# 数值计算与转换

[← 应用示例](../index.md)

保持十进制精度、安全窄化整数，并使用标准圆周率常数完成角度与弧度换算。

| 示例 | 教学目标 |
|---|---|
| [把金额换算为精确最小单位](exact-decimal-value.md) | 用 `Decimal.tryParse`、`reScale` 和无标度 `value` 做精确最小单位换算，并用 `@Derive` 生成稳定值语义。 |
| [范围检查后窄化整数](checked-narrowing.md) | 窄化整数前先检查目标类型范围，再调用转换构造器；`checked*` 只保护算术运算，`position()` 也不是安全转换 API。 |
| [在角度与弧度之间换算](angle-conversion.md) | 导入 std.math 扩展并使用 Float64.getPI()，集中封装度数到弧度的换算后再调用三角函数。 |
