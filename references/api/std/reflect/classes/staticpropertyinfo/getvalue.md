<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.staticpropertyinfo.getvalue" parent="std.reflect.class.staticpropertyinfo" -->
# StaticPropertyInfo.getValue

[← StaticPropertyInfo](index.md)

## 签名

```cangjie role=signature
public func getValue(): Any
```

获取该 StaticPropertyInfo 对应的静态成员属性的值。

## 契约

> **注意：**
>
> 如果该静态成员属性缺少合法实现，如 `interface` 类型中的抽象静态成员属性，则应抛出 UnsupportedException 异常，但由于后端尚未支持，故尚未实现。

返回值：

- Any - 该静态成员属性的值。
