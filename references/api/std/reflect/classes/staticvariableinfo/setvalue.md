<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.staticvariableinfo.setvalue" parent="std.reflect.class.staticvariableinfo" -->
# StaticVariableInfo.setValue

[← StaticVariableInfo](index.md)

## 签名

```cangjie role=signature
public func setValue(newValue: Any): Unit
```

设置该 StaticVariableInfo 对应的静态成员变量的值。

## 契约

参数：

- newValue: Any - 新值。

异常：

- IllegalSetException - 如果该 StaticVariableInfo 对应的静态成员变量不可修改，则抛出异常。
- IllegalTypeException - 如果新值 `newValue` 的运行时类型不是该静态成员变量信息所对应的静态成员变量的声明类型的子类型，则抛出异常。
