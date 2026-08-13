<!-- cj-doc kind="api-member" level="7" id="std.core.struct.array.flatten" parent="std.core.struct.array.extension.extend-t-array-array-t" -->
# Array<T>.flatten

[← extend<T> Array<Array<T>>](extensions/extend-t-array-array-t.md)

## 签名

```cangjie role=signature
public func flatten(): Array<T>
```

将当前二维数组展开为一维数组。

## 契约

例如将 [[1, 2], [3, 4]] 展开为 [1, 2, 3, 4]。

返回值：

- Array\<T> - 展开后的一维数组。
