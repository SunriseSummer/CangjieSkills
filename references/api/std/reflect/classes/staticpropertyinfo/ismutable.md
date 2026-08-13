<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.staticpropertyinfo.ismutable" parent="std.reflect.class.staticpropertyinfo" -->
# StaticPropertyInfo.isMutable

[← StaticPropertyInfo](index.md)

## 签名

```cangjie role=signature
public func isMutable(): Bool
```

判断该静态成员属性信息所对应的静态成员属性是否可修改。

## 契约

返回值：

- Bool - 如果该静态成员属性信息所对应的静态成员属性可被修改则返回 `true` ，否则返回 `false`。

> **注意：**
>
> 如果静态成员属性被 `mut` 修饰符所修饰，则该静态成员属性可被修改，否则不可被修改。
