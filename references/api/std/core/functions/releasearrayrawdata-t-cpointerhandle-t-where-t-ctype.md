<!-- cj-doc kind="api-member" level="5" id="std.core.func.releasearrayrawdata-t-cpointerhandle-t-where-t-ctype" parent="std.core" -->
# releaseArrayRawData<T>(CPointerHandle<T>) where T <: CType

[← std.core](../index.md)

## 签名

```cangjie role=signature
public unsafe func releaseArrayRawData<T>(handle: CPointerHandle<T>): Unit where T <: CType
```

释放原始指针实例，该实例通过 acquireArrayRawData 获取。

## 契约

参数：

- handle: CPointerHandle\<T> - 待释放的指针实例。
