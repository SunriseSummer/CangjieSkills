<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.array.7-拷贝.7-2-copyto-拷贝到目标数组" parent="language.collections.array.7-拷贝" -->
# 7.2 `copyTo` — 拷贝到目标数组

[← 7. 拷贝](index.md)

`copyTo(dst, srcStart, dstStart, copyLen)` 把当前数组从 `srcStart` 起的 `copyLen` 个元素复制到目标数组的 `dstStart` 位置；第三个参数是目标起点，不是复制长度。

```cangjie cjtest=syntax id=syntax-2c1bd0dfd5-1 form=unit
func copyTo(dst: Array<T>): Unit
func copyTo(dst: Array<T>, srcStart: Int64, dstStart: Int64, copyLen: Int64): Unit
```

```cangjie cjtest=syntax id=syntax-2c1bd0dfd5-2 form=stmt
let src = [1, 2, 3]
let dst = Array<Int64>(5, repeat: 0)
src.copyTo(dst)                    // dst = [1, 2, 3, 0, 0]
src.copyTo(dst, 0, 3, 2)          // dst = [1, 2, 3, 1, 2]（从 src[0] 取 2 个放到 dst[3]）
```

---

## 已验证示例

四参数重载的顺序是源起点、目标起点、复制长度。三者都是 `Int64`，写错顺序仍可能编译成功，因此应使用有区分度的数据和非零目标位置验证结果。

```cangjie cjtest=run id=guide.language.array-copyto.run form=unit
package array_copyto_example

main(): Unit {
    let source = [10, 20, 30, 40]
    let target = Array<Int64>(6, repeat: 0)
    source.copyTo(target, 1, 2, 2)
    println("${target[0]},${target[1]},${target[2]},${target[3]},${target[4]},${target[5]}")
}
```

```text cjtest=expect for=guide.language.array-copyto.run stream=stdout match=exact
0,0,20,30,0,0
```
