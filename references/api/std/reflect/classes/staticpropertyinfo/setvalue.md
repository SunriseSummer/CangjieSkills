<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.staticpropertyinfo.setvalue" parent="std.reflect.class.staticpropertyinfo" -->
# StaticPropertyInfo.setValue

[← StaticPropertyInfo](index.md)

## 签名

```cangjie role=signature
public func setValue(newValue: Any): Unit
```

设置该 StaticPropertyInfo 对应的静态成员属性的值。

## 契约

> **注意：**
>
> 如果该静态成员属性缺少合法实现，如 `interface` 类型中的抽象静态成员属性，则应抛出 UnsupportedException 异常，但由于后端尚未支持，故尚未实现。

参数：

- newValue: Any - 新值。

异常：

- IllegalSetException - 如果该静态成员属性信息所对应的静态成员属性不可修改，则抛出异常。
- IllegalTypeException - 如果新值 `newValue` 的运行时类型不是该静态成员属性信息所对应的静态成员属性的声明类型的子类型，则抛出异常。
