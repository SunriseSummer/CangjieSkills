<!-- cj-doc kind="example-leaf" level="4" id="examples.logging.global-logger" parent="examples.logging" -->
# 用 JsonLogger 记录结构化日志

[← 结构化日志](index.md)

设置全局 `JsonLogger`，为组件绑定固定属性，再用 `info` 附加事件字段；测试只断言稳定 JSON 字段。

## 典型示例

库代码可通过 `getGlobalLogger` 获取带固定属性的记录器，再用 `info` 附加本次事件属性。需要机器读取的结构化日志时选择 `JsonLogger`；测试时不要匹配动态时间戳，只检查级别、消息和字段。

```cangjie cjtest=run id=examples.logging.global-logger.api.stdx.logger.info.run form=unit requires=stdx timeout=60s
package stdx_logger_info_example

import std.io.ByteBuffer
import stdx.log.LogLevel
import stdx.log.getGlobalLogger
import stdx.log.setGlobalLogger
import stdx.logger.JsonLogger

main(): Unit {
    let output = ByteBuffer()
    let sink = JsonLogger(output)
    sink.level = LogLevel.INFO
    setGlobalLogger(sink)

    let logger = getGlobalLogger(("component", "billing"))
    logger.info("invoice created", ("invoiceId", 42))

    let record = String.fromUtf8(output.bytes())
    println(record.contains("\"level\":\"INFO\""))
    println(record.contains("\"msg\":\"invoice created\""))
    println(record.contains("\"component\":\"billing\""))
    println(record.contains("\"invoiceId\":42"))
    logger.close()
}
```

预期标准输出：

```text cjtest=expect for=examples.logging.global-logger.api.stdx.logger.info.run stream=stdout match=exact
true
true
true
true
```
