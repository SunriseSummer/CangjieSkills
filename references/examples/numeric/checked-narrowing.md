<!-- cj-doc kind="example-leaf" level="4" id="examples.numeric.checked-narrowing" parent="examples.numeric" -->
# 范围检查后窄化整数

[← 数值计算与转换](index.md)

窄化整数前先检查目标类型范围，再调用转换构造器；`checked*` 只保护算术运算，`position()` 也不是安全转换 API。

## 已验证的窄化转换

仓颉 1.0.5 没有把任意 `Int64` 安全窄化为 `UInt32` 并返回 Option 的专用 API。先显式检查目标类型范围，再调用转换构造器；`std.overflow` 的 `checked*` 只保护算术运算，不保护后续类型转换。

```cangjie cjtest=run id=std.checked-narrowing.run form=unit
package checked_narrowing_example

func toUInt32Checked(value: Int64): ?UInt32 {
    if (value < 0 || value > Int64(UInt32.Max)) {
        return None
    }
    return Some(UInt32(value))
}

main(): Unit {
    println(toUInt32Checked(4096).getOrThrow())
    println(toUInt32Checked(-1))
    println(toUInt32Checked(Int64(UInt32.Max) + 1))
}
```

预期标准输出：

```text cjtest=expect for=std.checked-narrowing.run stream=stdout match=exact
4096
None
None
```
