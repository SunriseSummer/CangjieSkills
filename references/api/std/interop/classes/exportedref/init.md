<!-- cj-doc kind="api-member" level="6" id="std.interop.class.exportedref.init" parent="std.interop.class.exportedref" -->
# ExportedRef.init

[← ExportedRef](index.md)

## 签名

```cangjie role=signature
protected init(exportedRef: Any, context: InteropContext)
```

基于要封装的对象或函数实例与互操作上下文环境构造一个 ExportedRef 实例。

## 参数

- exportedRef: Any - 被此类型包装的真正被外部依赖的函数或者对象。

- context: InteropContext - 用来表示这是哪种互操作的上下文环境。

