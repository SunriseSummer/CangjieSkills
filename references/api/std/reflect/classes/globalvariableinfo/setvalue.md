<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.globalvariableinfo.setvalue" parent="std.reflect.class.globalvariableinfo" -->
# GlobalVariableInfo.setValue

[← GlobalVariableInfo](index.md)

## 签名

```cangjie role=signature
public func setValue(newValue: Any): Unit
```

设置该 GlobalVariableInfo 对应的全局变量的值。

## 契约

参数：

- newValue: Any - 新的值。

异常：

- IllegalSetException - 如果该全局变量信息所对应的全局变量不可修改，则抛出异常。
- IllegalTypeException - 如果新值 `newValue` 的运行时类型不是全局变量信息所对应的全局变量的声明类型的子类型，则抛出异常。
