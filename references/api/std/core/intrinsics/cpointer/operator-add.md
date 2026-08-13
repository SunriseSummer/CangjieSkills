<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.cpointer.operator-add" parent="std.core.intrinsic.cpointer.extension.extend-t-cpointer-t" -->
# CPointer<T>.+

[← extend<T> CPointer<T>](extensions/extend-t-cpointer-t.md)

## 签名

```cangjie role=signature
public unsafe operator func +(offset: Int64): CPointer<T>
```

CPointer 对象指针后移，同 C 语言的指针加法操作。

## 契约

参数：

- offset: Int64 - 偏移量。

返回值：

- CPointer\<T> - 返回偏移后的指针。
