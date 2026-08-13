<!-- cj-doc kind="api-member" level="6" id="std.ref.class.weakref.prop-value" parent="std.ref.class.weakref" -->
# WeakRef<T> where T <: Object.value

[← WeakRef<T> where T <: Object](index.md)

## 签名

```cangjie role=signature
public prop value: Option<T>
```

读取弱引用指向的对象。

## 契约

功能：读取弱引用指向的对象。如果弱引用为空或弱引用中的对象已被清理则返回 `None`。

类型：Option\<T>
