<!-- cj-doc kind="example-leaf" level="4" id="examples.cli-process.process-output" parent="examples.cli-process" -->
# 执行子进程并捕获输出

[← 命令行与子进程](index.md)

调用真实可执行程序，合并 stdout/stderr，并以 trimAscii 处理跨平台换行。

## 典型示例

`executeWithOutput` 会等待子进程结束，并返回退出码、标准输出和标准错误的字节数组。下面调用当前工具链中的编译器并安全解码输出；大量输出应改用 `SubProcess` 的流式接口，避免一次性缓冲。

```cangjie cjtest=run id=examples.cli-process.process-output.api.process.execute-with-output.run form=unit timeout=30s
package execute_with_output_example

import std.process.*

main(): Unit {
    let (exitCode, stdout, stderr) = executeWithOutput("cjc", ["-v"])
    let output = String.fromUtf8(stdout) + String.fromUtf8(stderr)
    println(exitCode)
    println(output.contains("Cangjie Compiler: 1.1.3"))
}
```

预期标准输出：

```text cjtest=expect for=examples.cli-process.process-output.api.process.execute-with-output.run stream=stdout match=exact
0
true
```
