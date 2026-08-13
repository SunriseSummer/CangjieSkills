<!-- cj-doc kind="api-member" level="6" id="std.ref.class.weakref.init" parent="std.ref.class.weakref" -->
# WeakRef<T> where T <: Object.init

[← WeakRef<T> where T <: Object](index.md)

## 签名

```cangjie role=signature
public init(value: T, cleanupPolicy: CleanupPolicy)
```

为 `value` 对象创建弱引用，并指定清理策略。

## 契约

参数：

- value: T - 弱引用指向的对象。
- cleanupPolicy: CleanupPolicy - `value` 对象的清理策略。
