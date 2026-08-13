<!-- cj-doc kind="api-member" level="6" id="stdx.aspectCJ.class.insertatentry.field-init-packagename" parent="stdx.aspectCJ.class.insertatentry" -->
# InsertAtEntry.init(packageName!

[← InsertAtEntry](index.md)

## 签名

```cangjie role=signature
public const init(packageName!: String, className!: String, methodName!: String, isStatic!: Bool, funcTypeStr!: String, recursive!: Bool)
```

创建 InsertAtEntry 对象。

## 契约

参数：

- packageName: String - 被织入的函数的所属包名，如 "default", "std.core"；
- className: String - 如果被织入的函数是成员函数，则为函数所属类名；如果被织入的函数是全局函数，则为空；
- methodName: String - 被织入的函数名称，如 "foo"；
- isStatic: Bool - 被织入的函数是否为静态成员函数；
- funcTypeStr: String - 被织入的函数的类型字符串，不包括空格。对于自定义类型，类型定义所在的包名不可省略，且和类型名之间使用 `.` 分隔。不需要包括隐式的 this 形参的类型。如 "(Int64,std.core.Object)->Unit"；
- recursive: Bool - 当被织入的函数是成员函数时，表示是否对子类里的函数 override 版本也做织入；否则该字段应填 false。
