<!-- cj-doc kind="api-member" level="5" id="std.core.func.acquirearrayrawdata-t-array-t-where-t-ctype" parent="std.core" -->
# acquireArrayRawData<T>(Array<T>) where T <: CType

[← std.core](../index.md)

## 签名

```cangjie role=signature
public unsafe func acquireArrayRawData<T>(arr: Array<T>): CPointerHandle<T> where T <: CType
```

获取 Array<T> 中数据的原始指针实例，指针实例指向数组首元素的地址，T 需要满足 CType 约束。

## 契约

> **注意：**
>
> 指针使用完后需要及时用 releaseArrayRawData 函数释放该指针。
> 指针的获取和释放之间仅可包含简单的 foreign C 函数调用等逻辑，不构造例如 CString 等的仓颉对象，否则可能造成不可预期现象。

参数：

- arr: Array\<T> - 待获取原始指针的数组。

返回值：

- CPointerHandle\<T> - 数组的原始指针实例。
