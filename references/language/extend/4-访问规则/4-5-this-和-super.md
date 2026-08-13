<!-- cj-doc kind="guide-leaf" level="5" id="language.extend.4-访问规则.4-5-this-和-super" parent="language.extend.4-访问规则" -->
# 4.5 `this` 和 `super`

[← 4. 访问规则](index.md)

- 扩展实例成员**可以**使用 `this`（可省略）
- 扩展实例成员**不能**使用 `super`
```cangjie cjtest=syntax id=syntax-613b422145-1 form=unit
class A {
    var v = 0
}
extend A {
    func f() {
        print(this.v)  // OK
        print(v)       // OK，省略 this
    }
}
```
