<!-- cj-doc kind="example-leaf" level="4" id="examples.time.monotime-elapsed" parent="examples.time" -->
# 用 MonoTime 测量经过时间

[← 日期与时间](index.md)

在操作前后读取 `MonoTime.now()` 并相减得到 Duration；不要用可被系统校准的 DateTime 统计耗时。

## 典型示例

测量任务耗时应使用单调时钟：它只表达先后与时间间隔，不受系统日期、时区或校时影响。读取操作前后的 `MonoTime` 并相减即可得到 `Duration`；需要绝对日期时才使用 `DateTime`。

```cangjie cjtest=run id=examples.time.monotime-elapsed.api.time.monotime.elapsed.run form=unit timeout=20s
package monotime_elapsed_example

import std.time.MonoTime

main(): Unit {
    let begin = MonoTime.now()
    let elapsed = MonoTime.now() - begin
    println(elapsed >= Duration.Zero)

    let interval = Duration.millisecond * 5
    let deadline = begin + interval
    println(deadline - begin == interval)
}
```

预期标准输出：

```text cjtest=expect for=examples.time.monotime-elapsed.api.time.monotime.elapsed.run stream=stdout match=exact
true
true
```
