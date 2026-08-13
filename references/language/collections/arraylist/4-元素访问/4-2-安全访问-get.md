<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.arraylist.4-元素访问.4-2-安全访问-get" parent="language.collections.arraylist.4-元素访问" -->
# 4.2 安全访问 `get`

[← 4. 元素访问](index.md)

`func get(index: Int64): ?T`：安全访问 get。

```cangjie cjtest=syntax id=syntax-4115070983-1 form=unit
func get(index: Int64): ?T
```

```cangjie cjtest=syntax id=syntax-4115070983-2 form=stmt
list.get(1)   // Some(99)
list.get(10)  // None（不抛异常）
```
