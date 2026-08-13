<!-- cj-doc kind="guide-leaf" level="5" id="language.extend.4-访问规则.4-6-不能访问-private-成员" parent="language.extend.4-访问规则" -->
# 4.6 不能访问 `private` 成员

[← 4. 访问规则](index.md)

扩展不能读写被扩展类型的 `private` 成员。`protected` 及以上可访问
```cangjie cjtest=syntax id=syntax-97b240a1df-1 form=unit
class A {
    private var v1 = 0
    protected var v2 = 0
}
extend A {
    func f() {
        // print(v1)  // ❌ Error: 不能访问 private 成员
        print(v2)  // OK
    }
}
```
