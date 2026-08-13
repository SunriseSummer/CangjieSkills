<!-- cj-doc kind="guide-leaf" level="5" id="language.interface.1-接口定义.1-3-sealed-interface" parent="language.interface.1-接口定义" -->
# 1.3 `sealed interface`

[← 1. 接口定义](index.md)

- `sealed interface` — 仅同包内可继承/实现/扩展
- `sealed` 隐含 `public`/`open` 语义
- 继承 `sealed` 接口的子接口仍可被 `sealed` 修饰或不使用 `sealed`
- 若继承 `sealed` 接口的子接口被 `public` 修饰且不被 `sealed` 修饰，则该子接口可在包外被继承/实现/扩展
```cangjie cjtest=compile id=verified-c3947c6f1e-1
package A
sealed interface Shape {
    func area(): Float64
}

class Circle <: Shape {
    var radius: Float64
    public init(r: Float64) { radius = r }
    public func area(): Float64 { 3.14159 * radius * radius }
}

// 包外不能实现 Shape（sealed），但可通过非 sealed 的 public 子接口间接实现

main() {
    let c = Circle(5.0)
    println(c.area())  // 输出：78.539750
}
```

---
