<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.typeinfo.findannotation" parent="std.reflect.class.typeinfo" -->
# TypeInfo.findAnnotation

[← TypeInfo](index.md)

## 签名

```cangjie role=signature
public func findAnnotation<T>(): Option<T>
```

尝试获取拥有给定限定名称且作用于该对象的注解。

## 契约

返回值：

- Option\<T> - 如果成功匹配则返回该注解，重复标注或者无法匹配时返回 `None`。
