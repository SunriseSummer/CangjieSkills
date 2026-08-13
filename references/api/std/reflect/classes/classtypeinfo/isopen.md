<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.classtypeinfo.isopen" parent="std.reflect.class.classtypeinfo" -->
# ClassTypeInfo.isOpen

[← ClassTypeInfo](index.md)

## 签名

```cangjie role=signature
public func isOpen(): Bool
```

判断该 ClassTypeInfo 对应的 `class` 类型是否拥有 `open` 语义。

## 契约

> **注意：**
>
> 并不是只有被 `open` 修饰符所修饰的 `class` 类型定义才拥有 `open` 语义，如：`abstract class` 无论是否被 `open` 修饰符修饰都会拥有 `open` 语义。

返回值：

- Bool - 如果该 ClassTypeInfo 对应的 `class` 类型拥有 `open` 语义则返回 `true`，否则返回 `false`。
