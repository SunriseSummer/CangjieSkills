<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.globalvariableinfo.findallannotations" parent="std.reflect.class.globalvariableinfo" -->
# GlobalVariableInfo.findAllAnnotations

[← GlobalVariableInfo](index.md)

## 签名

```cangjie role=signature
public func findAllAnnotations<T>(): Array<T> where T <: Annotation
```

获取所有指定注解名称的自定义注解（通过泛型筛选）。

## 注意
>
不支持平台：macOS、iOS。

## 返回值

- Array<T> - 若无指定 T 类型的注解时，返回空数组；若有相关注解时，将所有该类型注解对象构成的数组返回。

