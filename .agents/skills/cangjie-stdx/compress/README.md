# 仓颉扩展标准库压缩 Skill

## 1. 概述

仓颉通过 `stdx.compress.zlib` 包提供基于 deflate 算法的压缩和解压功能。

| 导入 | 功能 |
|------|------|
| `import stdx.compress.zlib.*` | 压缩/解压流式 API |

> 使用前需配置好 stdx，详见 `cangjie-stdx` Skill

---

## 2. 核心类型

### 2.1 压缩格式（WrapType）

| 枚举值 | 说明 |
|--------|------|
| `DeflateFormat` | Deflate 原始格式（无封装头尾） |
| `GzipFormat` | Gzip 格式（含 gzip 头尾信息） |

### 2.2 压缩级别（CompressLevel）

| 枚举值 | 说明 |
|--------|------|
| `FastLevel` | 快速压缩，压缩率低 |
| `DefaultLevel` | 默认平衡级别 |
| `BestLevel` | 最高压缩率，速度最慢 |

### 2.3 流式 API

| 类 | 构造函数 | 说明 |
|---|---|---|
| `CompressOutputStream` | `(OutputStream, wrap: WrapType)` | 将数据压缩后写入输出流 |
| `CompressInputStream` | `(InputStream, wrap: WrapType)` | 从输入流读取并压缩 |
| `DecompressOutputStream` | `(OutputStream, wrap: WrapType)` | 将数据解压后写入输出流 |
| `DecompressInputStream` | `(InputStream, wrap: WrapType)` | 从输入流读取并解压 |

压缩/解压流均支持可选的 `level` 参数指定压缩级别（默认 `DefaultLevel`）。

---

## 3. 使用示例

### 3.1 内存中压缩与解压（Gzip 格式）

```cangjie
import stdx.compress.zlib.*
import std.io.ByteBuffer
import std.collection.ArrayList

main() {
    let original = "Hello, 仓颉! Repeated data helps compression: AAAAAAAAAA"

    // 压缩：数据 → CompressOutputStream → ByteBuffer
    let compressBuf = ByteBuffer()
    let compressor = CompressOutputStream(compressBuf, wrap: GzipFormat)
    compressor.write(original.toArray())
    compressor.flush()
    compressor.close()

    let compressed = compressBuf.bytes()
    println("Original size: ${original.size}")
    println("Compressed size: ${compressed.size}")

    // 解压：ByteBuffer → DecompressInputStream → 读取
    let decompressBuf = ByteBuffer()
    unsafe { decompressBuf.write(compressed) }
    let decompressor = DecompressInputStream(decompressBuf, wrap: GzipFormat)
    let resultList = ArrayList<Byte>()
    let buf = Array<UInt8>(1024, repeat: 0)
    while (true) {
        let n = decompressor.read(buf)
        if (n <= 0) { break }
        for (i in 0..n) {
            resultList.add(buf[i])
        }
    }
    decompressor.close()

    let result = Array<Byte>(resultList.size, {i => resultList[i]})
    let text = String.fromUtf8(result)
    println("Match: ${text == original}")  // true
}
```

### 3.2 文件压缩与解压

```cangjie
import stdx.compress.zlib.*
import std.fs.*

// 压缩文件
func compressFile(src: String, dest: String): Unit {
    let srcFile = File(src, Read)
    let destFile = File(dest, Write)
    let compressor = CompressOutputStream(destFile, wrap: DeflateFormat)

    let buf = Array<UInt8>(4096, repeat: 0)
    while (true) {
        let n = srcFile.read(buf)
        if (n <= 0) { break }
        compressor.write(buf.slice(0, n).toArray())
    }
    compressor.flush()
    compressor.close()
    srcFile.close()
    destFile.close()
}

// 解压文件
func decompressFile(src: String, dest: String): Unit {
    let srcFile = File(src, Read)
    let destFile = File(dest, Write)
    let decompressor = DecompressInputStream(srcFile, wrap: DeflateFormat)

    let buf = Array<UInt8>(4096, repeat: 0)
    while (true) {
        let n = decompressor.read(buf)
        if (n <= 0) { break }
        destFile.write(buf.slice(0, n).toArray())
    }
    decompressor.close()
    srcFile.close()
    destFile.close()
}
```

---

## 4. 注意事项

| 要点 | 说明 |
|------|------|
| **stdx 配置** | 压缩包属于 stdx，需先下载配置（详见 `cangjie-stdx` Skill） |
| **格式匹配** | 解压时必须使用与压缩时相同的 `WrapType`，否则抛出 `ZlibException` |
| **flush/close** | 压缩写入完成后必须调用 `flush()` 和 `close()` 确保数据完整写出 |
| **流式处理** | 适合处理大文件，无需将整个文件加载到内存 |
| **异常处理** | 数据损坏或格式不匹配时抛出 `ZlibException` |
