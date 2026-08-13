<!-- cj-doc kind="api-member" level="6" id="stdx.log.class.logger.info" parent="stdx.log.class.logger" -->
# Logger.info

[← Logger](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func info(String, Array<Attr>)

### 签名

```cangjie role=signature
public func info(message: String, attrs: Array<Attr>): Unit
```

打印 INFO 级别的日志的便捷函数。

### 契约

参数：

- message: String - 日志消息。
- attrs: Array\<Attr> - 日志数据键值对。

## func info(() -> String, Array<Attr>)

### 签名

```cangjie role=signature
public func info(message: () -> String, attrs: Array<Attr>): Unit
```

打印 INFO 级别的日志的便捷函数。

### 契约

参数：

- message: () -> String - 日志消息。
- attrs: Array\<Attr> - 日志数据键值对。

## 典型示例

库代码可通过 `getGlobalLogger` 获取带固定属性的记录器，再用 `info` 附加本次事件属性。需要机器读取的结构化日志时选择 `JsonLogger`；测试时不要匹配动态时间戳，只检查级别、消息和字段。

```cangjie cjtest=run id=api.stdx.logger.info.run form=unit requires=stdx timeout=60s
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

```text cjtest=expect for=api.stdx.logger.info.run stream=stdout match=exact
true
true
true
true
```
