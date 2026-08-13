<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.staticvariableinfo.ismutable" parent="std.reflect.class.staticvariableinfo" -->
# StaticVariableInfo.isMutable

[← StaticVariableInfo](index.md)

## 签名

```cangjie role=signature
public func isMutable(): Bool
```

判断该 StaticVariableInfo 对应的静态成员变量是否可修改。

## 契约

> **注意：**
>
> - 如果静态成员变量被 `var` 修饰符所修饰，则该静态成员变量可被修改。
> - 如果静态成员变量被 `let` 修饰符所修饰，则该静态成员变量不可被修改。

返回值：

- Bool - 如果该静态成员变量信息所对应的静态成员变量可被修改则返回 `true` ，否则返回 `false`。
