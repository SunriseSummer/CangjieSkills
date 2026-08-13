<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.overview.2-类型映射.2-4-varray-数组" parent="language.cffi.overview.2-类型映射" -->
# 2.4 VArray\<T, $N> 数组

[← 2. 类型映射](index.md)

`VArray<T, $N>` 映射到 C 的 `T[N]`。`T` 满足 `CType` 时，`VArray<T, $N>` 也满足 `CType`。

**作为函数参数：** 函数签名中参数类型可以是 `CPointer<T>` 或 `VArray<T, $N>`，传递时均以 `CPointer<T>` 形式传递，须用 `inout` 修饰。不能作为返回类型。

```c
// C 侧
void processArray(int a[3]);
```

```cangjie cjtest=syntax id=syntax-20caa406b2-1 form=unit
// 仓颉侧
foreign func processArray(a: VArray<Int32, $3>): Unit

main() {
    var arr: VArray<Int32, $3> = [1, 2, 3]
    unsafe { processArray(inout arr) }
}
```

**作为 @C struct 成员：** 内存布局与 C 一致。

```c
// C 侧
struct S { int a[2]; int b[0]; };
```

```cangjie cjtest=syntax id=syntax-20caa406b2-2 form=stmt
// 仓颉侧
@C
struct S {
    var a = VArray<Int32, $2>(repeat: 0)
    var b = VArray<Int32, $0>(repeat: 0)
}
```

> **注意：** 不支持 C 柔性数组（flexible array）的映射。
