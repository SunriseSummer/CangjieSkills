<!-- cj-doc kind="api-package" level="4" id="stdx.log" parent="api.stdx" -->
# stdx.log

[← stdx 包索引](../index.md)

提供与具体日志实现解耦的统一日志 API。

包路径：`stdx.log`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`abstract Logger <: Resource`](classes/logger/index.md) | 此抽象类提供基础的日志打印和管理功能。 |
| [`LogRecord`](classes/logrecord/index.md) | 日志消息的“负载”。 |
| [`abstract LogWriter`](classes/logwriter/index.md) | LogWriter 提供了将仓颉对象序列化成日志输出目标的能力。 |
| [`NoopLogger <: Logger`](classes/nooplogger/index.md) | Logger 的 NO-OP（无操作）实现，会丢弃所有的日志。 |
| [`open LogException <: Exception`](classes/logexception/index.md) | 用于处理 log 相关的异常。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`LogValue`](interfaces/logvalue/index.md) | 为类型提供序列化到日志输出目标的接口。 |

## 结构体

| 声明 | 功能 |
|---|---|
| [`LogLevel <: ToString & Comparable<LogLevel>`](structs/loglevel/index.md) | LogLevel 为日志级别结构体。 |

## 类型别名

| 声明 | 功能 |
|---|---|
| [`Attr = (String, LogValue)`](types/attr.md) | 日志消息的键值对类型，是 (String, LogValue) 的类型别名。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`getGlobalLogger(attrs: Array<Attr>): Logger`](functions/getgloballogger-array-attr.md) | 获取 Logger 对象。 |
| [`setGlobalLogger(logger: Logger): Unit`](functions/setgloballogger-logger.md) | 设置全局 Logger 对象。 |
