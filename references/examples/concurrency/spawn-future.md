<!-- cj-doc kind="example-leaf" level="4" id="examples.concurrency.spawn-future" parent="examples.concurrency" -->
# 取得并发任务结果

[← 并发任务与同步](index.md)

spawn 返回 Future；get 等待任务并取得 Lambda 返回值。

## 已验证示例

`spawn` 立即返回 `Future<T>`；`get()` 等待任务结束，并取得 Lambda 的返回值。

```cangjie cjtest=run id=examples.concurrency.spawn-future.language.spawn-future.run form=unit timeout=20s
package spawn_future_example

main(): Unit {
    let answer = spawn { => 6 * 7 }
    println(answer.get())
}
```

预期标准输出：

```text cjtest=expect for=examples.concurrency.spawn-future.language.spawn-future.run stream=stdout match=exact
42
```
