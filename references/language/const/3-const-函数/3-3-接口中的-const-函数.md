<!-- cj-doc kind="guide-leaf" level="5" id="language.const.3-const-函数.3-3-接口中的-const-函数" parent="language.const.3-const-函数" -->
# 3.3 接口中的 const 函数

[← 3. const 函数](index.md)

- 接口中的 `const` 函数，实现类型必须也用 `const` 函数才算实现接口
- 接口中的非 `const` 函数，实现类型使用 `const` 或非 `const` 函数都算实现接口
- 接口中的 `const` 函数与接口的 `static` 函数一样，只有在该接口作为泛型约束的时候，受约束的泛型变元或变量才能使用这些 `const` 函数

```cangjie cjtest=syntax id=syntax-148eacf457-1 form=unit
interface I {
    const func f(): Int64
    const static func f2(): Int64
}

class A <: I {
    public const func f() { 0 }
    public const static func f2() { 1 }
    const init() {}
}

const func g<T>(i: T) where T <: I {
    return i.f() + T.f2()
}
```

---
