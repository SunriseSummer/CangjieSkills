<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.enumconstructorinfo.findallannotations" parent="std.reflect.class.enumconstructorinfo" -->
# EnumConstructorInfo.findAllAnnotations

[← EnumConstructorInfo](index.md)

## 签名

```cangjie role=signature
public func findAllAnnotations<T>(): Array<T> where T <: Annotation
```

获取该构造子上的所有类型为 `T` 的注解实例。

## 注意
>
不支持平台：macOS、iOS、OpenHarmony、HarmonyOS。

## 返回值

- Array<T> - 注解列表。

