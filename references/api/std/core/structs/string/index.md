<!-- cj-doc kind="api-type" level="5" id="std.core.struct.string" parent="std.core" -->
# String

[← std.core](../../index.md)

`String <: Collection<Byte> & Comparable<String> & Hashable & ToString`

该结构体表示仓颉字符串，提供了构造、查找、拼接等一系列字符串操作。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`empty: String = String()`](field-empty.md) | 创建一个空的字符串并返回。 |
| [`size: Int64`](prop-size.md) | 获取字符串 UTF-8 编码后的字节长度。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个空的字符串。 |
| [`init(value: Array<Rune>)`](init.md) | 根据字符数组构造一个字符串，字符串内容为数组中的所有字符。 |
| [`init(value: Collection<Rune>)`](init.md) | 据字符集合构造一个字符串，字符串内容为集合中的所有字符。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static checkUtf8Encoding(data: Array<UInt8>): Bool`](checkutf8encoding.md) | 检查一个 Byte 数组是否符合 UTF-8 编码。 |
| [`static fromUtf8(utf8Data: Array<UInt8>): String`](fromutf8.md) | 根据 UTF-8 编码的字节数组构造一个字符串。 |
| [`unsafe static fromUtf8Unchecked(utf8Data: Array<UInt8>): String`](fromutf8unchecked.md) | 根据字节数组构造一个字符串。 |
| [`static join(strArray: Array<String>, delimiter!: String = String.empty): String`](join.md) | 连接字符串列表中的所有字符串，以指定分隔符分隔。 |
| [`static unsafe withRawData(rawData: Array<UInt8>): String`](withrawdata.md) | 根据字节数组构造一个字符串。 |
| [`clone(): String`](clone.md) | 返回原字符串的拷贝。 |
| [`compare(str: String): Ordering`](compare.md) | 按字典序比较当前字符串和参数指定的字符串。 |
| [`contains(str: String): Bool`](contains.md) | 判断原字符串中是否包含字符串 str。 |
| [`count(str: String): Int64`](count.md) | 返回子字符串 str 在原字符串中出现的次数。 |
| [`endsWith(suffix: String): Bool`](endswith.md) | 判断原字符串是否以 suffix 字符串为后缀结尾。 |
| [`equalsIgnoreAsciiCase(that: String): Bool`](equalsignoreasciicase.md) | 判断当前字符串和指定字符串是否相等，忽略大小写。 |
| [`get(index: Int64): Option<Byte>`](get.md) | 返回字符串下标 index 对应的 UTF-8 编码字节值。 |
| [`hashCode(): Int64`](hashcode.md) | 获取字符串的哈希值。 |
| [`indexOf(b: Byte): Option<Int64>`](indexof.md) | 获取指定字节 b 第一次出现的在原字符串内的索引。 |
| [`indexOf(b: Byte, fromIndex: Int64): Option<Int64>`](indexof.md) | 从原字符串指定索引开始搜索，获取指定字节第一次出现的在原字符串内的索引。 |
| [`indexOf(str: String): Option<Int64>`](indexof.md) | 返回指定字符串 str 在原字符串中第一次出现的起始索引。 |
| [`indexOf(str: String, fromIndex: Int64): Option<Int64>`](indexof.md) | 从原字符串 fromIndex 索引开始搜索，获取指定字符串 str 第一次出现的在原字符串的起始索引。 |
| [`isAscii(): Bool`](isascii.md) | 判断字符串是否是一个 Ascii 字符串，如果字符串为空或没有 Ascii 以外的字符，则返回 true。 |
| [`isAsciiBlank(): Bool`](isasciiblank.md) | 判断字符串是否为空或者字符串中的所有 Rune 都是 ascii 码的空白字符（包括：0x09、0x10、0x11、0x12、0x13、0x20）。 |
| [`isEmpty(): Bool`](isempty.md) | 判断原字符串是否为空字符串。 |
| [`iterator(): Iterator<Byte>`](iterator.md) | 获取字符串的 UTF-8 编码字节迭代器，可用于支持 for-in 循环。 |
| [`lastIndexOf(b: Byte): Option<Int64>`](lastindexof.md) | 返回指定字节 b 最后一次出现的在原字符串内的索引。 |
| [`lastIndexOf(b: Byte, fromIndex: Int64): Option<Int64>`](lastindexof.md) | 从原字符串 fromIndex 索引开始搜索，返回指定 UTF-8 编码字节 b 最后一次出现的在原字符串内的索引。 |
| [`lastIndexOf(str: String): Option<Int64>`](lastindexof.md) | 返回指定字符串 str 最后一次出现的在原字符串的起始索引。 |
| [`lastIndexOf(str: String, fromIndex: Int64): Option<Int64>`](lastindexof.md) | 从原字符串指定索引开始搜索，获取指定字符串 str 最后一次出现的在原字符串的起始索引。 |
| [`lazySplit(str: String, removeEmpty!: Bool = false): Iterator<String>`](lazysplit.md) | 对原字符串按照字符串 str 分隔符分割，该函数不立即对字符串进行分割，而是返回迭代器，使用迭代器进行遍历时再实际执行分隔操作。 |
| [`lazySplit(str: String, maxSplits: Int64, removeEmpty!: Bool = false): Iterator<String>`](lazysplit.md) | 对原字符串按照字符串 str 分隔符分割，该函数不立即对字符串进行分割，而是返回迭代器，使用迭代器进行遍历时再实际执行分隔操作。 |
| [`lines(): Iterator<String>`](lines.md) | 获取字符串的行迭代器，每行都由换行符进行分隔，换行符是 `\n` `\r` `\r\n` 之一，结果中每行不包括换行符。 |
| [`padEnd(totalWidth: Int64, padding!: String = " "): String`](padend.md) | 按指定长度左对齐原字符串，如果原字符串长度小于指定长度，在其右侧添加指定字符串。 |
| [`padStart(totalWidth: Int64, padding!: String = " "): String`](padstart.md) | 按指定长度右对齐原字符串，如果原字符串长度小于指定长度，在其左侧添加指定字符串。 |
| [`unsafe rawData(): Array<Byte>`](rawdata.md) | 获取字符串的 UTF-8 编码的原始字节数组。 |
| [`removePrefix(prefix: String): String`](removeprefix.md) | 去除字符串的 prefix 前缀。 |
| [`removeSuffix(suffix: String): String`](removesuffix.md) | 去除字符串的 suffix 后缀。 |
| [`replace(old: String, new: String): String`](replace.md) | 使用新字符串替换原字符串中旧字符串。 |
| [`runes(): Iterator<Rune>`](runes.md) | 获取字符串的 Rune 迭代器。 |
| [`split(str: String, removeEmpty!: Bool = false): Array<String>`](split.md) | 对原字符串按照字符串 str 分隔符分割，指定是否删除空串。 |
| [`split(str: String, maxSplits: Int64, removeEmpty!: Bool = false): Array<String>`](split.md) | 对原字符串按照字符串 str 分隔符分割，指定最多分隔子串数，以及是否删除空串。 |
| [`startsWith(prefix: String): Bool`](startswith.md) | 判断原字符串是否以 prefix 字符串为前缀。 |
| [`toArray(): Array<Byte>`](toarray.md) | 获取字符串的 UTF-8 编码的字节数组。 |
| [`toAsciiLower(): String`](toasciilower.md) | 把 ASCII 大写字母转成小写；处理协议关键字、枚举文本等 ASCII 输入时直接调用 `text.toAsciiLower()`，无需导入 std.unicode。 |
| [`toAsciiTitle(): String`](toasciititle.md) | 将该字符串标题化。 |
| [`toAsciiUpper(): String`](toasciiupper.md) | 将该字符串中所有 Ascii 小写字母转化为 Ascii 大写字母。 |
| [`toRuneArray(): Array<Rune>`](torunearray.md) | 获取字符串的 Rune 数组。 |
| [`toString(): String`](tostring.md) | 获得字符串本身。 |
| [`trimAscii(): String`](trimascii.md) | 去除原字符串开头结尾以 ASCII 空白字符组成的子字符串。 |
| [`trimAsciiEnd(): String`](trimasciiend.md) | 去除原字符串结尾以 ASCII 空白字符组成的子字符串。 |
| [`trimAsciiStart(): String`](trimasciistart.md) | 去除原字符串开头以 ASCII 空白字符组成的子字符串。 |
| [`trimEnd(predicate: (Rune)->Bool): String`](trimend.md) | 修剪当前字符串，从尾开始删除符合过滤条件的 Rune 字符，直到第一个不符合过滤条件的 Rune 字符为止。 |
| [`trimEnd(set: Array<Rune>): String`](trimend.md) | 修剪当前字符串，从尾开始删除在 set 中的 Rune 字符，直到第一个不在 set 中的 Rune 字符为止。 |
| [`trimEnd(set: String): String`](trimend.md) | 修剪当前字符串，从尾开始删除在 set 中的 Rune 字符，直到第一个不在 set 中的 Rune 字符为止。 |
| [`trimStart(predicate: (Rune)->Bool): String`](trimstart.md) | 修剪当前字符串，从头开始删除符合过滤条件的 Rune 字符，直到第一个不符合过滤条件的 Rune 字符为止。 |
| [`trimStart(set: Array<Rune>): String`](trimstart.md) | 修剪当前字符串，从头开始删除在 set 中的 Rune 字符，直到第一个不在 set 中的 Rune 字符为止。 |
| [`trimStart(set: String): String`](trimstart.md) | 修剪当前字符串，从头开始删除在 set 中的 Rune 字符，直到第一个不在 set 中的 Rune 字符为止。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator const !=(right: String): Bool`](operator-ne.md) | 判断两个字符串是否不相等。 |
| [`operator const *(count: Int64): String`](operator-mul.md) | 原字符串重复 count 次。 |
| [`operator const +(right: String): String`](operator-add.md) | 两个字符串相加，将 right 字符串拼接在原字符串的末尾。 |
| [`operator const <(right: String): Bool`](operator-lt.md) | 判断两个字符串大小。 |
| [`operator const <=(right: String): Bool`](operator-le.md) | 判断两个字符串大小。 |
| [`operator const ==(right: String): Bool`](operator-eq.md) | 判断两个字符串是否相等。 |
| [`operator const >(right: String): Bool`](operator-gt.md) | 判断两个字符串大小。 |
| [`operator const >=(right: String): Bool`](operator-ge.md) | 判断两个字符串大小。 |
| [`operator const [](index: Int64): Byte`](operator-indexer.md) | 返回指定索引 index 处的 UTF-8 编码字节。 |
| [`operator const [](range: Range<Int64>): String`](operator-indexer.md) | 根据给定区间获取当前字符串的切片。 |
