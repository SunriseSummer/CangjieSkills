<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.overview.2-类型映射.2-2-c-struct-结构体" parent="language.cffi.overview.2-类型映射" -->
# 2.2 @C struct 结构体

[← 2. 类型映射](index.md)

用 `@C` 修饰的 `struct` 映射到 C 结构体，内存布局与 C 一致：

```c
// C 侧
typedef struct {
    int64_t x;
    int64_t y;
    int64_t z;
} Point3D;

Point3D addPoint(Point3D p1, Point3D p2);
```

```cangjie cjtest=syntax id=syntax-7e34cdc639-1 form=stmt
// 仓颉侧
@C
struct Point3D {
    var x: Int64 = 0
    var y: Int64 = 0
    var z: Int64 = 0
}

foreign func addPoint(p1: Point3D, p2: Point3D): Point3D
```

限制：

- 成员类型须满足 `CType` 约束
- 不能实现或扩展接口
- 不能作为 `enum` 关联值类型
- 不允许被闭包捕获
- 不能有泛型参数
- `@C struct` 自动满足 `CType` 约束
