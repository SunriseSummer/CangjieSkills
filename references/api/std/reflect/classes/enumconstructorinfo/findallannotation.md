<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.enumconstructorinfo.findallannotation" parent="std.reflect.class.enumconstructorinfo" -->
# EnumConstructorInfo.findAllAnnotation

[← EnumConstructorInfo](index.md)

## 签名

```cangjie role=signature
public func findAllAnnotation<T>(): ?T where T <: Annotation
```

获取该构造子上的任意一个类型为 `T` 的注解实例。

## 注意
>
不支持平台：macOS、iOS、OpenHarmony、HarmonyOS。

## 返回值

- ?T - 注解实例或 `None`。

