<!-- cj-doc kind="index" level="3" id="api.std" parent="api" -->
# std 包索引

本页只列包及职责；进入包页后再选择类型、接口或顶层函数。

| 包 | 功能 | 类型/顶层声明 |
|---|---|---:|
| [std.argopt](argopt/index.md) | 提供从命令行参数字符串解析出参数名和参数值的相关能力。 | 5 |
| [std.ast](ast/index.md) | 提供源码解析函数及抽象语法树节点。 | 122 |
| [std.binary](binary/index.md) | 在仓颉数据类型与大端/小端字节序列之间转换。 | 3 |
| [std.collection](collection/index.md) | 提供常见数据结构、集合抽象接口和通用集合函数。 | 56 |
| [std.collection.concurrent](collection-concurrent/index.md) | 提供了并发安全的集合类型实现。 | 6 |
| [std.convert](convert/index.md) | 提供从字符串转到特定类型的 Convert 系列函数。 | 3 |
| [std.core](core/index.md) | 提供基础类型、核心接口、异常、并发原语及全局函数。 | 126 |
| [std.crypto.cipher](crypto/cipher/index.md) | 提供对称加解密通用接口。 | 1 |
| [std.crypto.digest](crypto/digest/index.md) | 提供常用摘要算法的通用接口，包括 MD5、SHA1、SHA224、SHA256、SHA384、SHA512、HMAC、SM3 等。 | 3 |
| [std.database.sql](database-sql/index.md) | 提供仓颉访问数据库的接口。 | 16 |
| [std.deriving](deriving/index.md) | 用 `@Derive[ToString, Hashable, Equatable, Comparable]` 为类、结构体或枚举生成所列接口的实现；字段默认参与、属性默认不参与。 | 4 |
| [std.env](env/index.md) | 访问环境变量、命令行、标准流、进程信息与退出回调。 | 18 |
| [std.fs](fs/index.md) | 操作文件、目录、路径和文件元数据。 | 21 |
| [std.io](io/index.md) | 提供程序与外部设备进行数据交换的能力。 | 18 |
| [std.interop](interop/index.md) | 为跨语言互操作库提供对象导出、句柄生命周期管理与跨运行时循环引用协同能力；当前用于 ArkTS 互操作。 | 4 |
| [std.math](math/index.md) | 提供数学常量与数值函数；自然对数使用 `log`（没有 `ln`）；常用 Float64 签名包括 `sqrt(x: Float64)`、`log(x: Float64)`、`sin(x: Float64)`、`cos(x: Float64)`，返回值均为 Float64。 | 159 |
| [std.math.numeric](math-numeric/index.md) | 对基础类型可表达范围之外提供扩展能力。 | 12 |
| [std.net](net/index.md) | 提供 TCP、UDP、Unix Domain Socket 及 IP/Socket 地址类型。 | 29 |
| [std.overflow](overflow/index.md) | 提供了整数运算溢出时的处理能力。 | 12 |
| [std.process](process/index.md) | 创建和管理子进程，并处理标准流、等待与状态查询。 | 8 |
| [std.random](random/index.md) | 提供生成伪随机数的能力。 | 1 |
| [std.ref](ref/index.md) | 提供弱引用与清理相关能力。 | 3 |
| [std.reflect](reflect/index.md) | 在运行时查询类型信息，并动态读写或调用成员。 | 26 |
| [std.regex](regex/index.md) | 使用正则表达式查找、验证、替换和分割文本。 | 5 |
| [std.runtime](runtime/index.md) | 控制、管理和监视程序运行时状态。 | 16 |
| [std.sort](sort/index.md) | `std.sort` 顶层函数 `sort(data)` 可对实现 Comparable 的 Array、ArrayList 或 List 升序排序；也可传 `key`、`lessThan`、`by` 或 `descending` 自定义规则。 | 12 |
| [std.sync](sync/index.md) | 提供并发编程相关的能力。 | 22 |
| [std.time](time/index.md) | 提供日期时间、时间间隔、单调时间、时区及其计算和比较。 | 8 |
| [std.unicode](unicode/index.md) | 按 Unicode 标准分类和转换字符。 | 3 |
| [std.unittest](unittest/index.md) | 提供单元测试与基准测试的声明、断言、生命周期、参数化和扩展机制。 | 106 |
| [std.unittest.common](unittest-common/index.md) | 单元测试框架提供了打印所需的类型和一些通用方法。 | 19 |
| [std.unittest.diff](unittest-diff/index.md) | 单元测试框架提供了打印差异对比信息所需的 API 。 | 1 |
| [std.unittest.mock](unittest-mock/index.md) | 创建和配置与真实声明签名一致的 mock 对象。 | 33 |
| [std.unittest.mock.mockmacro](unittest-mock-mockmacro/index.md) | mock 框架提供了用户所需的宏。 | 2 |
| [std.unittest.prop_test](unittest-prop-test/index.md) | 单元测试框架提供了参数化测试所需的类型和方法。 | 24 |
| [std.unittest.testmacro](unittest-testmacro/index.md) | 单元测试框架提供了用户所需的宏。 | 26 |
