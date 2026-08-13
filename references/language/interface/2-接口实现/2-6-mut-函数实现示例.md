<!-- cj-doc kind="guide-leaf" level="5" id="language.interface.2-接口实现.2-6-mut-函数实现示例" parent="language.interface.2-接口实现" -->
# 2.6 `mut` 函数实现示例

[← 2. 接口实现](index.md)

结构体实现会修改自身状态的接口成员时，实现函数也必须带 `mut`。

```cangjie cjtest=syntax id=syntax-e808352f35-1 form=unit
interface Resettable {
    mut func reset(): Unit
}

struct Counter <: Resettable {
    var count: Int64 = 0
    public mut func reset(): Unit {  // struct 须匹配 mut
        count = 0
    }
}

class Logger <: Resettable {
    var entries = 0
    public func reset(): Unit {  // class 忽略 mut
        entries = 0
    }
}
```

---
