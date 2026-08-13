<!-- cj-doc kind="api-member" level="6" id="std.time.struct.monotime.now" parent="std.time.struct.monotime" -->
# MonoTime.now

[← MonoTime](index.md)

## 签名

```cangjie role=signature
public static func now(): MonoTime
```

获取与当前时间对应的 MonoTime。

## 契约

返回值：

- MonoTime - 与当前时间对应的 MonoTime。

## 典型示例

测量任务耗时应使用单调时钟：它只表达先后与时间间隔，不受系统日期、时区或校时影响。读取操作前后的 `MonoTime` 并相减即可得到 `Duration`；需要绝对日期时才使用 `DateTime`。

```cangjie cjtest=run id=api.time.monotime.elapsed.run form=unit timeout=20s
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

```text cjtest=expect for=api.time.monotime.elapsed.run stream=stdout match=exact
true
true
```
