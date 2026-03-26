# 仓颉扩展标准库编码工具 Skill

## 1. 概述

仓颉扩展标准库提供三个编码/解码工具包：

| 包 | 导入 | 功能 |
|---|---|---|
| **Base64** | `import stdx.encoding.base64.*` | 二进制数据与 Base64 字符串互转 |
| **Hex** | `import stdx.encoding.hex.*` | 二进制数据与十六进制字符串互转 |
| **URL** | `import stdx.encoding.url.*` | URL 解析、编解码、Form 表单处理 |

> 使用前需配置好 stdx，详见 `cangjie-stdx` Skill

---

## 2. Base64 编解码（stdx.encoding.base64）

Base64 将二进制数据转换为仅由 64 个可打印字符（A-Z、a-z、0-9、+、/）组成的文本格式，适合在文本环境中安全传输二进制数据。

### 2.1 API

| 函数 | 签名 | 说明 |
|------|------|------|
| `toBase64String` | `(Array<Byte>) -> String` | 将字节数组编码为 Base64 字符串 |
| `fromBase64String` | `(String) -> Option<Array<Byte>>` | 将 Base64 字符串解码为字节数组，失败返回 `None` |

### 2.2 使用示例

```cangjie
import stdx.encoding.base64.*

main() {
    // 编码：字节数组 → Base64 字符串
    let data: Array<Byte> = [72, 101, 108, 108, 111]  // "Hello" 的 UTF-8 字节
    let encoded = toBase64String(data)
    println(encoded)  // SGVsbG8=

    // 解码：Base64 字符串 → 字节数组
    match (fromBase64String(encoded)) {
        case Some(bytes) =>
            println(String.fromUtf8(bytes))  // Hello
        case None =>
            println("解码失败")
    }
}
```

### 2.3 实用场景

```cangjie
import stdx.encoding.base64.*

main() {
    // 将字符串编码为 Base64
    let text = "Hello, 仓颉!"
    let b64 = toBase64String(text.toArray())
    println(b64)

    // 解码回字符串
    let decoded = fromBase64String(b64).getOrThrow()
    println(String.fromUtf8(decoded))  // Hello, 仓颉!
}
```

---

## 3. Hex 编解码（stdx.encoding.hex）

Hex 编码将每个字节表示为两个十六进制字符（0-9、a-f），常用于调试、哈希值显示等场景。

### 3.1 API

| 函数 | 签名 | 说明 |
|------|------|------|
| `toHexString` | `(Array<Byte>) -> String` | 将字节数组编码为十六进制字符串 |
| `fromHexString` | `(String) -> Option<Array<Byte>>` | 将十六进制字符串解码为字节数组，失败返回 `None` |

### 3.2 使用示例

```cangjie
import stdx.encoding.hex.*

main() {
    // 编码
    let data: Array<Byte> = [0x48, 0x65, 0x6C, 0x6C, 0x6F]
    let hex = toHexString(data)
    println(hex)  // 48656c6c6f

    // 解码
    match (fromHexString(hex)) {
        case Some(bytes) =>
            println(String.fromUtf8(bytes))  // Hello
        case None =>
            println("解码失败")
    }
}
```

---

## 4. URL 处理（stdx.encoding.url）

### 4.1 URL 类 — 解析与访问

`URL.parse(urlString)` 将 URL 字符串解析为 `URL` 对象，可访问各组件属性。

URL 格式：`scheme://host[:port]/path[?query][#fragment]`

| 属性 | 类型 | 说明 |
|------|------|------|
| `scheme` | `String` | 协议（http、https 等） |
| `host` | `String` | 主机名（含端口） |
| `hostName` | `String` | 主机名（不含端口） |
| `port` | `Int64` | 端口号 |
| `path` | `String` | 资源路径（已解码） |
| `rawPath` | `String` | 原始路径（未解码） |
| `query` | `Option<String>` | 查询参数（已解码） |
| `rawQuery` | `Option<String>` | 原始查询参数（未解码） |
| `fragment` | `Option<String>` | 片段标识符（已解码） |
| `rawFragment` | `Option<String>` | 原始片段标识符（未解码） |
| `userInfo` | `String` | 用户信息 |

```cangjie
import stdx.encoding.url.*

main() {
    let url = URL.parse("http://www.example.com:80/path?key=value#section")
    println("scheme = ${url.scheme}")       // http
    println("host = ${url.host}")           // www.example.com:80
    println("hostName = ${url.hostName}")   // www.example.com
    println("port = ${url.port}")           // 80
    println("path = ${url.path}")           // /path
    println("query = ${url.query.getOrThrow()}")       // key=value
    println("fragment = ${url.fragment.getOrThrow()}")  // section
}
```

### 4.2 Form 类 — 表单参数处理

`Form` 以 key-value 形式存储 HTTP 请求参数，同一个 key 可对应多个 value。

| 方法 | 说明 |
|------|------|
| `Form()` | 创建空 Form |
| `Form(queryString)` | 从查询字符串解析（自动 URL 解码） |
| `get(key)` | 获取第一个匹配值，返回 `Option<String>` |
| `add(key, value)` | 添加键值对（不覆盖已有同名键） |
| `set(key, value)` | 设置键值（覆盖已有同名键的所有值） |
| `clone()` | 深拷贝 |

```cangjie
import stdx.encoding.url.*

main() {
    // 从查询字符串解析
    let f = Form("name=Alice&age=30&name=Bob")
    println(f.get("name").getOrThrow())   // Alice（返回第一个值）
    println(f.get("age").getOrThrow())    // 30

    // 手动构建
    let f2 = Form()
    f2.add("key", "value1")
    f2.add("key", "value2")
    println(f2.get("key").getOrThrow())   // value1

    f2.set("key", "newValue")
    println(f2.get("key").getOrThrow())   // newValue
}
```

---

## 5. 注意事项

| 要点 | 说明 |
|------|------|
| **stdx 配置** | 编码包属于 stdx，需先下载配置（详见 `cangjie-stdx` Skill） |
| **Base64 解码失败** | `fromBase64String` 对非法 Base64 字符串返回 `None`，不抛异常 |
| **Hex 解码失败** | `fromHexString` 对非法十六进制字符串返回 `None`，不抛异常 |
| **URL 解析失败** | `URL.parse` 对非法 URL 抛出 `UrlSyntaxException` |
| **URL 编码** | URL 中的非 ASCII 字符使用 `%XX` 编码（UTF-8 字节的十六进制表示） |
| **Form 解码** | Form 构造时自动对查询字符串进行 URL 解码 |
