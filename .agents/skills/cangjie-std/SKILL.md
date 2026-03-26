---
name: cangjie-std
description: "提供仓颉语言标准库常用功能速查文档，包括集合框架/时间日期/数学运算/并发同步/正则表达式/文件系统/IO流/进程管理/排序/环境变量/随机数/类型转换/标准输入输出/命令行参数处理/单元测试框架等"
---

请按需查询当前目录下的标准库文档：

[std.collection](./collection/README.md)：集合框架，包括 ArrayList、HashMap、HashSet、TreeMap、TreeSet、LinkedList、ArrayDeque 等数据结构，以及函数式管道操作（filter/map/forEach/fold/reduce/collect 等迭代器操作）。

[std.time](./time/README.md)：时间日期处理，包括 DateTime 构造/格式化/解析/时区转换、MonoTime 单调时钟计时、Duration 时间间隔、Month/DayOfWeek 枚举等。

[std.math](./math/README.md)：数学运算，包括 abs/sqrt/pow/log 等常用函数、sin/cos/tan 三角函数、ceil/floor/round 取整、gcd/lcm 整数运算、浮点数特殊值(NaN/Inf)检查等。

[std.sync](./sync/README.md)：并发同步原语，包括 Atomic 原子类型（AtomicInt64/AtomicBool 等）、Mutex 互斥锁与 synchronized 块、Condition 条件变量(wait/notify)、Timer 定时器、Barrier/Semaphore/SyncCounter 等。

[std.regex](./regex/README.md)：正则表达式，包括 Regex 创建与匹配标志(IgnoreCase/MultiLine)、find/findAll 查找、replace/replaceAll 替换、split 分割、捕获组与命名组等。

[std.fs](./fs/README.md)：文件系统操作，包括 File 读写(read/write/append)、Directory 目录操作(create/readFrom/walk)、Path 路径处理(join/parent/extensionName)、FileInfo 文件信息等。

[std.io](./io/README.md)：I/O 流模型，包括 InputStream/OutputStream 接口、ByteBuffer 内存流、BufferedInputStream/BufferedOutputStream 缓冲流、StringReader/StringWriter 字符串流、ChainedInputStream/MultiOutputStream 链式流、流工具函数(copy/readToEnd/readString)等。

[std.process](./process/README.md)：进程管理，包括 launch 创建子进程、execute/executeWithOutput 执行命令、SubProcess 标准流重定向(Pipe/Inherit/Null)、findProcess 查找进程、进程等待与终止等。

[std.env](./env/README.md)：进程环境，包括环境变量读写(getVariable/setVariable)、进程信息(getProcessId/getWorkingDirectory)、标准流(getStdIn/getStdOut/getStdErr)、进程退出(exit/atExit)等。

[std.sort](./sort/README.md)：排序功能，包括对 Array/ArrayList/List 排序、自定义比较器(by/lessThan/key)、稳定排序(stable)、降序排序(descending)等。

[std.random](./random/README.md)：随机数生成，包括 Random 类、nextInt/nextFloat/nextBool 方法、指定范围随机数(upper)、高斯分布(nextGaussianFloat64)、种子控制等。

[std.convert](./convert/)：类型转换与格式化，包括[字符串解析为基础类型](./convert/parsable.md)（Parsable 接口、整数/浮点/布尔解析、进制转换）和[数值格式化输出](./convert/formattable.md)（Formattable 接口、宽度/对齐/精度/进制格式化）。

[std.unittest](./unittest/README.md)：单元测试框架，包括 @Test/@TestCase 声明测试、@Assert/@Expect/@PowerAssert 断言、@BeforeAll/@AfterAll/@BeforeEach/@AfterEach 生命周期、参数化测试、基准测试(@Bench)、Mock/Spy 对象与桩配置(@On)等。

[std.stdio](./stdio/README.md)：标准输入输出，包括 print/println 标准输出、eprint/eprintln 标准错误输出、readln/read 标准输入、Console 控制台读写等。

[std.args](./args/README.md)：命令行参数处理，包括 main(args) 接收命令行参数、std.argopt 包解析短选项(-v)/长选项(--output)/组合选项、ArgumentSpec/ParsedArguments API 等。

[others](./index.md)：标准库其他包和 API 功能速查表（core/binary/crypto/database.sql/deriving/reflect/unicode/overflow 等）。

