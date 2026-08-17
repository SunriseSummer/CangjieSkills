<!-- cj-doc kind="api-member" level="6" id="std.interop.class.interopcontext.init" parent="std.interop.class.interopcontext" -->
# InteropContext.init

[← InteropContext](index.md)

## 签名

```cangjie role=signature
protected init(handler: (ExportedRef, ForeignProxy) -> Unit)
```

用来构造一个 InteropContext 实例。

## 参数

- handler: (ExportedRef, ForeignProxy) -> Unit - 在特定互操作场景下用来处理跨语言循环引用中垃圾内存的函数。

回调必须接受两个参数；不需要处理循环引用的最小上下文可传入无副作用 Lambda `{_, _ => ()}`。回调不应抛异常。
