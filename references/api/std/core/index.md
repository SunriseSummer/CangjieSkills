<!-- cj-doc kind="api-package" level="4" id="std.core" parent="api.std" -->
# std.core

[← std 包索引](../index.md)

提供基础类型、核心接口、异常、并发原语及全局函数。

包路径：`std.core`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`ArrayIterator<T> <: Iterator<T>`](classes/arrayiterator/index.md) | 数组迭代器，迭代功能详述见 Iterable 和 Iterator 说明。 |
| [`Box<T>`](classes/box/index.md) | Box 类型提供了为其他类型添加一层 `class` 封装的能力。 |
| [`Future<T>`](classes/future/index.md) | Future<T> 实例代表一个仓颉线程任务，可用于获取仓颉线程的计算结果，向仓颉线程发送取消信号。 |
| [`abstract Iterator<T> <: Iterable<T>`](classes/iterator/index.md) | 该类表示迭代器，提供 `next` 方法支持对容器内的成员进行迭代遍历。 |
| [`open Object <: Any`](classes/object/index.md) | Object 是所有 `class` 的父类，所有 `class` 都默认继承它。 |
| [`RangeIterator<T> <: Iterator<T> where T <: Countable<T> & Comparable<T> & Equatable<T>`](classes/rangeiterator/index.md) | Range 类型的迭代器，迭代功能详述见 Iterable 和 Iterator 接口说明。 |
| [`open StackTraceElement`](classes/stacktraceelement/index.md) | 表示一个异常堆栈的具体信息，包括异常发生的类名、函数名、文件名、行号。 |
| [`StringBuilder <: ToString`](classes/stringbuilder/index.md) | 该类主要用于字符串的构建。 |
| [`Thread`](classes/thread/index.md) | 获取线程 ID 及名字、查询线程是否存在取消请求、注册线程未处理异常的处理函数等。 |
| [`ThreadLocal<T>`](classes/threadlocal/index.md) | 该类表示仓颉线程局部变量。 |
| [`open ArithmeticException <: Exception`](classes/arithmeticexception/index.md) | 算术异常类，发生算术异常时使用。 |
| [`open Error <: ToString`](classes/error/index.md) | Error 是所有错误类的基类。 |
| [`open Exception <: ToString`](classes/exception/index.md) | Exception 是所有异常类的父类。 |
| [`open IllegalArgumentException <: Exception`](classes/illegalargumentexception/index.md) | 表示参数非法的异常类。 |
| [`open IllegalFormatException <: IllegalArgumentException`](classes/illegalformatexception/index.md) | 表示变量的格式无效或不标准时的异常类。 |
| [`IllegalMemoryException <: Exception`](classes/illegalmemoryexception/index.md) | 表示内存操作错误的异常类。 |
| [`IllegalStateException <: Exception`](classes/illegalstateexception/index.md) | 表示状态非法的异常类。 |
| [`IncompatiblePackageException <: Exception`](classes/incompatiblepackageexception/index.md) | 表示包不兼容的异常类。 |
| [`IndexOutOfBoundsException <: Exception`](classes/indexoutofboundsexception/index.md) | 表示索引越界的异常类。 |
| [`NegativeArraySizeException <: Exception`](classes/negativearraysizeexception/index.md) | 表示数组大小为负数的异常类。 |
| [`NoneValueException <: Exception`](classes/nonevalueexception/index.md) | 表示 Option<T> 实例的值为 `None` 的异常类，通常在 `getOrThrow` 函数中被抛出。 |
| [`OutOfMemoryError <: Error`](classes/outofmemoryerror.md) | 表示内存不足错误的错误类，该类不可被继承，不可初始化，但是可以被捕获到。 |
| [`OverflowException <: ArithmeticException`](classes/overflowexception/index.md) | 表示算术运算溢出的异常类。 |
| [`SpawnException <: Exception`](classes/spawnexception/index.md) | 线程异常类，表示线程处理过程中发生异常。 |
| [`StackOverflowError <: Error`](classes/stackoverflowerror/index.md) | 表示堆栈溢出错误的错误类，该类不可被继承，不可初始化，但是可以被捕获到。 |
| [`TimeoutException <: Exception`](classes/timeoutexception/index.md) | 当阻塞操作超时时引发异常。 |
| [`UnsupportedException <: Exception`](classes/unsupportedexception/index.md) | 表示功能未支持的异常类。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`Any`](interfaces/any/index.md) | Any 是所有类型的父类型，所有 `interface` 都默认继承它，所有非 `interface` 类型都默认实现它。 |
| [`Collection<T> <: Iterable<T>`](interfaces/collection/index.md) | 该接口用来表示集合，通常容器类型应该实现该接口。 |
| [`Comparable<T> <: Equatable<T> & Less<T> & Greater<T> & LessOrEqual<T> & GreaterOrEqual<T>`](interfaces/comparable/index.md) | 该接口表示比较运算，是等于、不等于、小于、大于、小于等于、大于等于接口的集合体。 |
| [`Countable<T>`](interfaces/countable/index.md) | 该接口表示类型可数。 |
| [`sealed CType`](interfaces/ctype.md) | 表示支持与 C 语言互操作的接口。 |
| [`Equal<T>`](interfaces/equal/index.md) | 该接口用于支持判等操作。 |
| [`Equatable<T> <: Equal<T> & NotEqual<T>`](interfaces/equatable/index.md) | 该接口是判等和判不等两个接口的集合体。 |
| [`Greater<T>`](interfaces/greater/index.md) | 该接口表示大于计算。 |
| [`GreaterOrEqual<T>`](interfaces/greaterorequal/index.md) | 该接口表示大于等于计算。 |
| [`Hashable`](interfaces/hashable/index.md) | 该接口用于计算哈希值。 |
| [`Hasher`](interfaces/hasher/index.md) | 该接口用于处理哈希组合运算。 |
| [`Iterable<E>`](interfaces/iterable/index.md) | 该接口表示可迭代，实现了该接口的类型（通常为容器类型）可以在 `for-in` 语句中实现迭代，也可以获取其对应的迭代器类型实例，调用 `next` 函数实现迭代。 |
| [`Less<T>`](interfaces/less/index.md) | 该接口表示小于计算。 |
| [`LessOrEqual<T>`](interfaces/lessorequal/index.md) | 该接口表示小于等于计算。 |
| [`NotEqual<T>`](interfaces/notequal/index.md) | 该接口用于支持判不等操作。 |
| [`Resource`](interfaces/resource/index.md) | 该接口用于资源管理，通常用于内存、句柄等资源的关闭和释放。 |
| [`ThreadContext`](interfaces/threadcontext/index.md) | 仓颉线程上下文接口。 |
| [`ToString`](interfaces/tostring/index.md) | 该接口用来提供具体类型的字符串表示。 |

## 结构体

| 声明 | 功能 |
|---|---|
| [`Array<T>`](structs/array/index.md) | 固定长度的同类型元素序列；可用数组字面量、`Array<T>()`、`Array<T>(size, repeat: value)` 或 `Array<T>(size, {index => value})` 构造，引用类型的 repeat 值会被各元素共享。 |
| [`CPointerHandle<T> where T <: CType`](structs/cpointerhandle/index.md) | 表示 Array 数组的原始指针，该类型中的泛型参数应该满足 CType 约束。 |
| [`CPointerResource<T> <: Resource where T <: CType`](structs/cpointerresource/index.md) | 该结构体表示 CPointer 对应的资源管理类型，其实例可以通过 CPointer 的成员函数 `asResource` 获取。 |
| [`CStringResource <: Resource`](structs/cstringresource/index.md) | 该结构体表示 CString 对应的资源管理类型，其实例可以通过 CString 的成员函数 `asResource` 获取。 |
| [`DefaultHasher <: Hasher`](structs/defaulthasher/index.md) | 该结构体提供了默认哈希算法实现。 |
| [`Duration <: ToString & Hashable & Comparable<Duration>`](structs/duration/index.md) | Duration 表示时间间隔，是一个描述一段时间的时间类型，提供了常用的静态实例，以及计算、比较等功能。 |
| [`LibC`](structs/libc/index.md) | 提供了仓颉中较为高频使用的 C 接口，如申请、释放堆上 CType 实例。 |
| [`Range<T> <: Iterable<T> where T <: Countable<T> & Comparable<T> & Equatable<T>`](structs/range/index.md) | 该类是区间类型，用于表示一个拥有固定范围和步长的 `T` 的序列，要求 `T` 是可数的，有序的。 |
| [`String <: Collection<Byte> & Comparable<String> & Hashable & ToString`](structs/string/index.md) | 该结构体表示仓颉字符串，提供了构造、查找、拼接等一系列字符串操作。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`AnnotationKind`](enums/annotationkind/index.md) | 表示自定义注解希望支持的位置。 |
| [`Endian`](enums/endian/index.md) | 枚举类型 Endian 表示运行平台的端序，分为大端序和小端序。 |
| [`Option<T>`](enums/option/index.md) | 用 `Some`/`None` 表达可能缺失的值；优先用 `match`、`if-let`、`??` 或 `?.` 消费，只在缺失确属异常时调用 `getOrThrow()`，判断状态可用 `isSome()`/`isNone()`。 |
| [`Ordering`](enums/ordering/index.md) | Ordering 表示比较大小的结果，它包含三种情况：小于，大于和等于。 |

## 内置类型

| 声明 | 功能 |
|---|---|
| [`Bool`](intrinsics/bool/index.md) | 表示布尔类型，有 `true` 和 `false` 两种取值。 |
| [`CPointer<T>`](intrinsics/cpointer/index.md) | 表示 `T` 类型实例的指针，在与 C 语言互操作的场景下使用，对应 C 语言的 `T*`。 |
| [`CString`](intrinsics/cstring/index.md) | 表示 C 风格字符串，在与 C 语言互操作的场景下使用。 |
| [`Float16`](intrinsics/float16/index.md) | 表示 16 位浮点数，符合 `IEEE 754` 中的半精度格式（`binary16`）。 |
| [`Float32`](intrinsics/float32/index.md) | 表示 32 位浮点数，符合 `IEEE 754` 中的单精度格式（`binary32`）。 |
| [`Float64`](intrinsics/float64/index.md) | 64 位浮点类型；数值转换用 `Float64(value)`。 |
| [`Int16`](intrinsics/int16/index.md) | 表示 16 位有符号整型，表示范围为 [-2^{15}, 2^{15} - 1]。 |
| [`Int32`](intrinsics/int32/index.md) | 表示 32 位有符号整型，表示范围为 [-2^{31}, 2^{31} - 1]。 |
| [`Int64`](intrinsics/int64/index.md) | 表示 64 位有符号整型，表示范围为 [-2^{63}, 2^{63} - 1]。 |
| [`Int8`](intrinsics/int8/index.md) | 表示 8 位有符号整型，表示范围为 [-2^7, 2^7 - 1]。 |
| [`IntNative`](intrinsics/intnative/index.md) | 表示平台相关的有符号整型，其长度与当前系统的位宽一致。 |
| [`Rune`](intrinsics/rune/index.md) | Unicode 字符标量类型；字面量必须带 `r` 前缀，如 `r'a'`，而普通 `'a'` 是 `String`。 |
| [`UInt16`](intrinsics/uint16/index.md) | 表示 16 位无符号整型，表示范围为 [0, 2^{16} - 1]。 |
| [`UInt32`](intrinsics/uint32/index.md) | 表示 32 位无符号整型，表示范围为 [0, 2^{32} - 1]。 |
| [`UInt64`](intrinsics/uint64/index.md) | 表示 64 位无符号整型，表示范围为 [0, 2^{64} - 1]。 |
| [`UInt8`](intrinsics/uint8/index.md) | 表示 8 位无符号整型，表示范围为 [0, 2^8 - 1]。 |
| [`UIntNative`](intrinsics/uintnative/index.md) | 表示平台相关的无符号整型，其长度与当前系统的位宽一致。 |
| [`Unit`](intrinsics/unit/index.md) | 表示仓颉语言中只关心副作用而不关心值的表达式的类型。 |

## 类型别名

| 声明 | 功能 |
|---|---|
| [`Byte = UInt8`](types/byte.md) | `Byte` 是 `UInt8` 的类型别名；ASCII 字节优先写 `b'A'`，整数常量可写 `65u8`，运行期数值用 `UInt8(value)` 显式转换。 |
| [`Int = Int64`](types/int.md) | Int 类型是内置类型 Int64 的别名。 |
| [`UInt = UInt64`](types/uint.md) | UInt 类型是内置类型 UInt64 的别名。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`unsafe acquireArrayRawData<T>(arr: Array<T>): CPointerHandle<T> where T <: CType`](functions/acquirearrayrawdata-t-array-t-where-t-ctype.md) | 获取 Array<T> 中数据的原始指针实例，指针实例指向数组首元素的地址，T 需要满足 CType 约束。 |
| [`alignOf<T>(): UIntNative where T <: CType`](functions/alignof-t-where-t-ctype.md) | 获取类型 T 的内存对齐值。 |
| [`eprint(…) — 2 个重载`](functions/eprint.md) | 将指定字符串打印到标准错误文本流。 |
| [`eprintln(…) — 2 个重载`](functions/eprintln.md) | 将指定字符串打印到标准错误文本流，末尾添加换行。 |
| [`ifNone<T>(o: Option<T>, action: () -> Unit): Unit`](functions/ifnone-t-option-t-unit.md) | 如果输入是 Option.None 类型数据，则执行 action 函数。 |
| [`ifSome<T>(o: Option<T>, action: (T) -> Unit): Unit`](functions/ifsome-t-option-t-t-unit.md) | 如果输入是 Option.Some 类型数据，则执行 action 函数。 |
| [`max<T>(a: T, b: T, others: Array<T>): T where T <: Comparable<T>`](functions/max-t-t-t-array-t-where-t-comparable-t.md) | 根据 T 类型的 Comparable 接口实现，返回一组数据中的最大值，由于此函数的第三个参数是一个变长参数，支持获取二个以上的数据的比较。 |
| [`min<T>(a: T, b: T, others: Array<T>): T where T <: Comparable<T>`](functions/min-t-t-t-array-t-where-t-comparable-t.md) | 根据 T 类型的 Comparable 接口实现，返回一组数据中的最小值，由于此函数的第三个参数是一个变长参数，支持获取二个以上的数据的比较。 |
| [`print(…) — 15 个重载`](functions/print/index.md) | 向控制台输出 Bool 类型数据的字符串表达。 |
| [`println(…) — 16 个重载`](functions/println/index.md) | 向标准输出（stdout）输出换行符。 |
| [`readln(): String`](functions/readln.md) | 接受控制台输入，直到遇到换行或 EOF 结束。 |
| [`refEq(a: Object, b: Object): Bool`](functions/refeq-object-object.md) | 判断两个 Object 实例的内存地址是否相同。 |
| [`unsafe releaseArrayRawData<T>(handle: CPointerHandle<T>): Unit where T <: CType`](functions/releasearrayrawdata-t-cpointerhandle-t-where-t-ctype.md) | 释放原始指针实例，该实例通过 acquireArrayRawData 获取。 |
| [`sizeOf<T>(): UIntNative where T <: CType`](functions/sizeof-t-where-t-ctype.md) | 获取类型 T 所占用的内存空间大小。 |
| [`sleep(dur: Duration): Unit`](functions/sleep-duration.md) | 休眠当前线程。 |
| [`unsafe zeroValue<T>(): T`](functions/zerovalue-t.md) | 获取一个已全零初始化的 T 类型实例。 |
