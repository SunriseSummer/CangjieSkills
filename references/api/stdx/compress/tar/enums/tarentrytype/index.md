<!-- cj-doc kind="api-type" level="5" id="stdx.compress.tar.enum.tarentrytype" parent="stdx.compress.tar" -->
# TarEntryType

[← stdx.compress.tar](../../index.md)

`enum TarEntryType`

tar 条目类型。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`prop flag: UInt8`](prop-flag.md) | 获取当前条目的 `typeflag` 字节值。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`Unknown(UInt8)`](init.md) | 构造一个未知类型条目枚举实例，用于保留无法识别或自定义的 `typeflag` 字节值。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static func fromFlag(flag: UInt8): TarEntryType`](fromflag.md) | 根据传入的 `typeflag` 字节值构造对应的 `TarEntryType` 枚举实例。 |
| [`func toString(): String`](tostring.md) | 返回当前条目类型枚举实例的字符串表示。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator func !=(rhs: TarEntryType): Bool`](operator-ne.md) | 判断当前条目类型枚举实例是否与传入的条目类型枚举实例不相等。 |
| [`operator func ==(rhs: TarEntryType): Bool`](operator-eq.md) | 判断当前条目类型枚举实例是否与传入的条目类型枚举实例相等。 |

## 枚举值

| 签名 | 功能 |
|---|---|
| [`BlockDevice`](value-blockdevice.md) | 构造一个块设备文件类型枚举实例，对应 typeflag `'4'`。 |
| [`CharDevice`](value-chardevice.md) | 构造一个字符设备文件类型枚举实例，对应 typeflag `'3'`。 |
| [`ContiguousFile`](value-contiguousfile.md) | 构造一个连续文件类型枚举实例，用于表示数据在存储介质上连续排列的文件（typeflag `'7'`）。 |
| [`Directory`](value-directory.md) | 构造一个目录类型枚举实例，对应 typeflag `'5'`。 |
| [`ExtendedHeader`](value-extendedheader.md) | 构造一个 PAX 扩展头类型枚举实例，对应 typeflag `'x'`，用于存储附加元数据。 |
| [`Fifo`](value-fifo.md) | 构造一个命名管道（FIFO）类型枚举实例，对应 typeflag `'6'`。 |
| [`GlobalExtendedHeader`](value-globalextendedheader.md) | 构造一个 PAX 全局扩展头类型枚举实例，对应 typeflag `'g'`，适用于作用于整个归档的全局元信息。 |
| [`GnuDumpDir`](value-gnudumpdir.md) | 构造一个 GNU Dump 目录类型枚举实例，对应 typeflag `'D'`。 |
| [`GnuLongLink`](value-gnulonglink.md) | 构造一个 GNU 长链接名扩展类型枚举实例，对应 typeflag `'K'`。 |
| [`GnuLongName`](value-gnulongname.md) | 构造一个 GNU 长文件名扩展类型枚举实例，对应 typeflag `'L'`。 |
| [`GnuMultiVolume`](value-gnumultivolume.md) | 构造一个 GNU 多卷归档条目类型枚举实例，对应 typeflag `'M'`。 |
| [`GnuName`](value-gnuname.md) | 构造一个 GNU 文件名表条目类型枚举实例，对应 typeflag `'N'`。 |
| [`GnuSparse`](value-gnusparse.md) | 构造一个 GNU 稀疏文件类型枚举实例，对应 typeflag `'S'`。 |
| [`GnuVolumeHeader`](value-gnuvolumeheader.md) | 构造一个 GNU 卷头条目类型枚举实例，对应 typeflag `'V'`。 |
| [`HardLink`](value-hardlink.md) | 构造一个硬链接类型枚举实例，对应 typeflag `'1'`。 |
| [`RegularFile`](value-regularfile.md) | 构造一个标准普通文件类型枚举实例，对应 POSIX/USTAR 格式中的普通文件（typeflag `'0'`）。 |
| [`Symlink`](value-symlink.md) | 构造一个符号链接类型枚举实例，对应 typeflag `'2'`。 |
| [`V7RegularFile`](value-v7regularfile.md) | 构造一个 V7 格式的普通文件类型枚举实例，对应早期 Unix V7 格式（typeflag `\0`）。 |

