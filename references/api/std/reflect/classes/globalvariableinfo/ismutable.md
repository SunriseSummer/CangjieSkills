<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.globalvariableinfo.ismutable" parent="std.reflect.class.globalvariableinfo" -->
# GlobalVariableInfo.isMutable

[← GlobalVariableInfo](index.md)

## 签名

```cangjie role=signature
public func isMutable(): Bool
```

判断该 GlobalVariableInfo 对应的全局变量是否可修改。

## 契约

> **注意：**
>
> - 如果实例成员变量被 `var` 修饰符所修饰，则该全局变量可被修改。
> - 如果实例成员变量被 `let` 修饰符所修饰，则该全局变量不可被修改。

返回值：

- Bool - 如果该全局变量可被修改则返回 `true` ，否则返回 `false`。
