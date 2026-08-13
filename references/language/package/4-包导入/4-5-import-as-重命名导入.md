<!-- cj-doc kind="guide-leaf" level="5" id="language.package.4-包导入.4-5-import-as-重命名导入" parent="language.package.4-包导入" -->
# 4.5 import as（重命名导入）

[← 4. 包导入](index.md)

- 重命名导入以解决冲突：`import pkg.name as newName`、`import pkg as alias`
- 重命名后原名不可用
- 不重命名时，冲突名称在使用处报错（非导入处）
- 也可 `import fullPkg` 用作命名空间限定符
```cangjie cjtest=syntax id=syntax-2b84fd7856-1 form=unit
// 用 import as 解决名称冲突
import p1.C as C1
import p2.C as C2

main() {
    let _ = C1()  // 使用 p1 的 C
    let _ = C2()  // 使用 p2 的 C
}
```
```cangjie cjtest=syntax id=syntax-2b84fd7856-2 form=unit
// 用包名作为命名空间限定符
import p1
import p2

main() {
    let _ = p1.C()  // 通过包名限定
    let _ = p2.C()  // 通过包名限定
}
```
