<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.instancefunctioninfo.isopen" parent="std.reflect.class.instancefunctioninfo" -->
# InstanceFunctionInfo.isOpen

[← InstanceFunctionInfo](index.md)

## 签名

```cangjie role=signature
public func isOpen(): Bool
```

判断该 InstanceFunctionInfo 对应的实例成员函数是否拥有 `open` 语义。

## 契约

返回值：

- Bool - 如果该实例成员函数拥有 `open` 语义则返回 `true`，否则返回 `false`。

> **注意：**
>
> `interface` 类型中的实例成员函数默认均拥有 `open` 语义。
