<!-- cj-doc kind="api-member" level="6" id="std.ref.class.weakref.clear" parent="std.ref.class.weakref" -->
# WeakRef<T> where T <: Object.clear

[← WeakRef<T> where T <: Object](index.md)

## 签名

```cangjie role=signature
public func clear(): Unit
```

强制清理弱引用指向的对象，后续对 `value` 的访问将返回 `None`。
