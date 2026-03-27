# 仓颉扩展标准库日志 Skill

## 1. 概述

仓颉通过扩展标准库提供日志功能，涉及两个包：

| 包 | 导入 | 功能 |
|---|---|---|
| **stdx.log** | `import stdx.log.*` | 日志抽象层：Logger 接口、日志级别、全局 Logger 管理 |
| **stdx.logger** | `import stdx.logger.*` | 日志实现：SimpleLogger 等开箱即用的 Logger |

> 使用前需配置好 stdx，详见 `cangjie-stdx` Skill

---

## 2. 核心类型

### 2.1 日志级别（LogLevel）

| 级别 | 常量 | 说明 |
|------|------|------|
| TRACE | `LogLevel.TRACE` | 最详细的跟踪信息 |
| DEBUG | `LogLevel.DEBUG` | 调试信息 |
| INFO | `LogLevel.INFO` | 一般信息（默认级别） |
| WARN | `LogLevel.WARN` | 警告信息 |
| ERROR | `LogLevel.ERROR` | 错误信息 |
| FATAL | `LogLevel.FATAL` | 致命错误 |
| OFF | `LogLevel.OFF` | 关闭日志 |

### 2.2 Logger 抽象类

`Logger` 是日志系统的核心抽象，提供以下方法：

| 方法 | 说明 |
|------|------|
| `log(level: LogLevel, message: String, attrs: Array<Attr>)` | 记录指定级别的日志，附带键值对属性 |
| `log(level: LogLevel, messageFn: () -> String, attrs: Array<Attr>)` | 延迟求值版本，仅在级别启用时才计算消息 |
| `trace(message: String, attrs: Array<Attr>)` | 记录 TRACE 级别日志 |
| `debug(message: String, attrs: Array<Attr>)` | 记录 DEBUG 级别日志 |
| `info(message: String, attrs: Array<Attr>)` | 记录 INFO 级别日志 |
| `warn(message: String, attrs: Array<Attr>)` | 记录 WARN 级别日志 |
| `error(message: String, attrs: Array<Attr>)` | 记录 ERROR 级别日志 |
| `fatal(message: String, attrs: Array<Attr>)` | 记录 FATAL 级别日志 |
| `enabled(level: LogLevel): Bool` | 检查指定级别是否启用 |
| `withAttrs(attrs: Array<Attr>): Logger` | 创建带预设属性的子 Logger |

### 2.3 Attr 类型

日志属性是键值对类型 `(String, LogValue)` 的别名。`LogValue` 接口已为常见类型（String、Int64、Bool 等）提供了实现。

### 2.4 全局 Logger 管理

| 函数 | 说明 |
|------|------|
| `setGlobalLogger(logger: Logger): Unit` | 设置全局 Logger 实例 |
| `getGlobalLogger(attrs: Array<Attr>): Logger` | 获取全局 Logger（可附带默认属性） |

---

## 3. 快速开始

### 3.1 基本使用

```cangjie
import stdx.log.*
import stdx.logger.*
import std.env.*

main() {
    // 创建并设置全局 Logger
    let logger = SimpleLogger(getStdOut())
    logger.level = LogLevel.TRACE
    setGlobalLogger(logger)

    // 获取 Logger 并记录日志
    let log = getGlobalLogger(("module", "main"))
    log.info("Application started")
    log.debug("Debug info", ("key", "value"))
    log.trace("Trace detail", ("count", 42))
}
```

输出示例：
```text
2024-06-15T10:30:00Z INFO Application started module="main"
2024-06-15T10:30:00Z DEBUG Debug info module="main" key="value"
2024-06-15T10:30:00Z TRACE Trace detail module="main" count=42
```

### 3.2 库开发中使用日志

库代码中不应设置全局 Logger，而是获取全局 Logger 记录日志：

```cangjie
import stdx.log.*

public class DatabaseConnection {
    let logger = getGlobalLogger(("component", "DatabaseConnection"))

    public func connect(host: String): Unit {
        logger.info("Connecting to database", ("host", host))
        // ... 连接逻辑
        logger.debug("Connection established")
    }

    public func close(): Unit {
        logger.trace("Closing connection")
    }
}
```

### 3.3 延迟求值（避免性能开销）

当日志消息构造较耗时时，使用 Lambda 延迟求值版本：

```cangjie
import stdx.log.*
import stdx.logger.*
import std.env.*

main() {
    let logger = SimpleLogger(getStdOut())
    logger.level = LogLevel.INFO
    setGlobalLogger(logger)

    let log = getGlobalLogger()
    // 仅当 DEBUG 级别启用时才执行 Lambda 计算消息
    log.debug({=> "Expensive computation result: ${computeExpensiveValue()}"})
}

func computeExpensiveValue(): String {
    "computed"
}
```

---

## 4. 注意事项

| 要点 | 说明 |
|------|------|
| **stdx 配置** | 日志包属于 stdx，需先下载配置（详见 `cangjie-stdx` Skill） |
| **默认 Logger** | 未调用 `setGlobalLogger` 时，全局 Logger 是 `NoopLogger`（不输出任何日志） |
| **级别过滤** | 低于 Logger 设置级别的日志不会输出，也不会计算延迟消息 |
| **SimpleLogger** | `stdx.logger` 包中提供的简单 Logger 实现，输出到指定 `OutputStream` |
| **线程安全** | 全局 Logger 的获取和设置是线程安全的 |
| **属性继承** | `withAttrs` 和 `getGlobalLogger(attrs...)` 创建的 Logger 会自动携带预设属性 |
