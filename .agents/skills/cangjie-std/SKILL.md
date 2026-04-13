---
name: cangjie-std
description: "提供仓颉语言标准库常用功能速查文档，包括核心类型/集合/时间日期/数学运算/扩展数值/并发同步/并发集合/正则表达式/文件系统/IO流/网络通信/进程管理/排序/环境变量/随机数/二进制端序/整数溢出/Unicode字符/自动派生/反射/摘要算法/类型转换/标准输入输出/命令行参数处理/单元测试框架/弱引用等"
---

请按需查询当前目录下的标准库文档：

[std.core](./core/README.md)：核心包（自动导入），包括基本类型(Int/Float/Bool/String/Array/Option)、核心接口(Comparable/Hashable/Iterable/Resource)、StringBuilder、Duration 时间间隔、全局函数(print/println/spawn/sleep/min/max)、异常体系等。

[std.collection](./collection/README.md)：集合数据结构，包括 Array 定长数组（[详细](./collection/array/README.md)）、ArrayList 动态数组（[详细](./collection/arraylist/README.md)）、HashMap 哈希映射（[详细](./collection/hashmap/README.md)）、HashSet 哈希集合（[详细](./collection/hashset/README.md)）、TreeMap/TreeSet 有序集合、LinkedList 双向链表、ArrayDeque/ArrayQueue/ArrayStack 双端队列/队列/栈、函数式迭代操作(filter/map/fold/reduce)、收集函数(collectArray/collectHashMap)等。

[std.time](./time/README.md)：时间日期处理，包括 DateTime 构造/格式化/解析/时区转换、MonoTime 单调时钟计时、Duration 时间间隔、Month/DayOfWeek 枚举等。

[std.math](./math/README.md)：数学运算，包括 abs/sqrt/pow/log 等常用函数、sin/cos/tan 三角函数、ceil/floor/round 取整、gcd/lcm 整数运算、浮点数特殊值(NaN/Inf)检查等。

[std.math.numeric](./math_numeric/README.md)：扩展数值类型，包括 BigInt 任意精度整数（parse/divAndMod/modPow/bitLen）、Decimal 任意精度十进制数（precision/scale）、相关数学函数(abs/gcd/lcm/sqrt)等。

[std.sync](./sync/README.md)：并发同步原语，包括 Atomic 原子类型（AtomicInt64/AtomicBool 等）、Mutex 互斥锁与 synchronized 块、Condition 条件变量(wait/notify)、Timer 定时器、Barrier/Semaphore/SyncCounter 等。

[std.collection.concurrent](./collection_concurrent/README.md)：并发安全集合，包括 ConcurrentHashMap 线程安全哈希表、ArrayBlockingQueue/LinkedBlockingQueue 阻塞队列、ConcurrentLinkedQueue 非阻塞队列等。

[std.regex](./regex/README.md)：正则表达式，包括 Regex 创建与匹配标志(IgnoreCase/MultiLine)、find/findAll 查找、replace/replaceAll 替换、split 分割、捕获组与命名组等。

[std.fs](./fs/README.md)：文件系统操作，包括 File 读写(read/write/append)、Directory 目录操作(create/readFrom/walk)、Path 路径处理(join/parent/extensionName)、FileInfo 文件信息、HardLink/SymbolicLink 链接操作等。

[std.io](./io/README.md)：I/O 流模型，包括 InputStream/OutputStream 接口、ByteBuffer 内存流、BufferedInputStream/BufferedOutputStream 缓冲流、StringReader/StringWriter 字符串流、ChainedInputStream/MultiOutputStream 链式流、流工具函数(copy/readToEnd/readString)等。

[std.net](./net/README.md)：Socket 编程总览，包括类型层次、地址类型（IPAddress/IPPrefix/SocketAddress）、Socket 选项配置、异常处理等。详细文档：[TCP 编程](./net/TCP.md)、[UDP 编程](./net/UDP.md)、[Unix Domain Socket](./net/UDS.md)。

[std.process](./process/README.md)：进程管理，包括 launch 创建子进程、execute/executeWithOutput 执行命令、SubProcess 标准流重定向(Pipe/Inherit/Null)、findProcess 查找进程、进程等待与终止等。

[std.env](./env/README.md)：进程环境，包括环境变量读写(getVariable/setVariable)、进程信息(getProcessId/getWorkingDirectory)、标准流(getStdIn/getStdOut/getStdErr)、进程退出(exit/atExit)等。

[std.sort](./sort/README.md)：排序功能，包括对 Array/ArrayList/List 排序、自定义比较器(by/lessThan/key)、稳定排序(stable)、降序排序(descending)等。

[std.random](./random/README.md)：随机数生成，包括 Random 类、nextInt/nextFloat/nextBool 方法、指定范围随机数(upper)、高斯分布(nextGaussianFloat64)、种子控制等。

[std.binary](./binary/README.md)：二进制端序转换，包括 BigEndianOrder/LittleEndianOrder 大端序/小端序读写接口、支持 Bool/Float/Int/UInt 等基本类型、网络字节序处理等。

[std.overflow](./overflow/README.md)：整数溢出处理，包括 CheckedOp（返回 Option）、SaturatingOp（饱和截断）、ThrowingOp（抛异常）、WrappingOp（回绕截断）、CarryingOp（进位检测）五种溢出策略。

[std.unicode](./unicode/README.md)：Unicode 字符处理，包括 Rune 字符分类(isLetter/isNumber/isWhiteSpace)、大小写转换(toLowerCase/toUpperCase)、语言特定转换(CasingOption)等。

[std.deriving](./deriving/README.md)：自动派生，包括 @Derive[ToString/Hashable/Equatable/Comparable] 编译期自动实现接口、@DeriveExclude/@DeriveInclude 字段控制、@DeriveOrder 字段顺序等。

[std.reflect](./reflect/README.md)：运行时反射，包括 TypeInfo.of() 获取类型信息、ClassTypeInfo/StructTypeInfo 类型元数据、ConstructorInfo/InstanceFunctionInfo 成员信息、动态成员访问等。

[std.crypto.digest](./crypto_digest/README.md)：摘要算法，包括 Digest 接口(write/finish/reset)、digest() 便捷哈希函数、BlockCipher 对称加密接口等。

[std.convert](./convert/)：类型转换与格式化，包括[字符串解析为基础类型](./convert/parsable.md)（Parsable 接口、整数/浮点/布尔解析、进制转换）和[数值格式化输出](./convert/formattable.md)（Formattable 接口、宽度/对齐/精度/进制格式化）。

[std.unittest](./unittest/README.md)：单元测试框架，包括 @Test/@TestCase 声明测试、@Assert/@Expect/@PowerAssert 断言、@BeforeAll/@AfterAll/@BeforeEach/@AfterEach 生命周期、参数化测试、基准测试(@Bench)、Mock/Spy 对象与桩配置(@On)等。

[std.stdio](./stdio/README.md)：标准输入输出，包括 print/println 标准输出、eprint/eprintln 标准错误输出、readln/read 标准输入、Console 控制台读写等。

[std.args](./args/README.md)：命令行参数处理，包括 main(args) 接收命令行参数、std.argopt 包解析短选项(-v)/长选项(--output)/组合选项、ArgumentSpec/ParsedArguments API 等。

[std.ref](./ref/README.md)：弱引用，包括 WeakRef 弱引用管理、CleanupPolicy 清理策略(EAGER/DEFERRED)、缓存场景用法等。

