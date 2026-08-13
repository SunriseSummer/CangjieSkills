<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.overview.6-完整示例.6-1-结构体-inout" parent="language.cffi.overview.6-完整示例" -->
# 6.1 结构体，inout

[← 6. 完整示例](index.md)

代码展示 `typedef struct { int64_t x; int64_t y; } Point;` 的典型用法。

```c
// native.c
#include <stdio.h>
#include <stdint.h>

typedef struct { int64_t x; int64_t y; } Point;

// windows 平台加上 __declspec(dllexport) 修饰
void drawPoint(Point* point) {
    point->x = 10;
    point->y = 20;
    printf("Draw Point: (%lld, %lld)\n", point->x, point->y);
}
```

```cangjie cjtest=syntax id=syntax-04999a2f86-1 form=stmt
// main.cj
@C
struct Point {
    var x: Int64 = 0
    var y: Int64 = 0
}

foreign func drawPoint(point: CPointer<Point>): Unit

main() {
    var pt = Point()  // 须用 var 定义，inout 要求可变变量
    unsafe {
        drawPoint(inout pt)
        println("x = ${pt.x}, y = ${pt.y}")  // x = 10, y = 20
    }
}
```
