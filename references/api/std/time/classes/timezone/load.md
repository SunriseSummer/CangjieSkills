<!-- cj-doc kind="api-member" level="6" id="std.time.class.timezone.load" parent="std.time.class.timezone" -->
# TimeZone.load

[← TimeZone](index.md)

## 签名

```cangjie role=signature
public static func load(id: String): TimeZone
```

从系统中加载参数 `id` 指定的时区。

## 契约

> **说明：**
>
> - 在 Linux 、 macOS 系统中，若存在环境变量 CJ_TZPATH，则使用环境变量指定的路径加载时区文件（若存在多个通过分隔符 “:” 分开的环境变量值，则按照分隔路径的先后顺序依次查找时区文件，并加载第一个找到的时区文件），否则从系统时区文件目录（Linux 和 macOS 为 "/usr/share/zoneinfo"）加载时区。
> - 在 Windows 系统中，用户需下载时区文件并编译，设置环境变量 CJ_TZPATH 指向 zoneinfo 目录（若存在多个通过分隔符 “;” 分开的环境变量值，则按照分隔路径的先后顺序依次查找时区文件，并加载第一个找到的时区文件），否则会导致异常。

参数：

- id: String - 时区 ID。

返回值：

- TimeZone - 时区。

异常：

- IllegalArgumentException - 当参数 `id` 为空，或长度超过 4096 字节，或不符合标准时区 ID 格式时，抛出异常。
- InvalidDataException - 当时区文件加载失败（找不到文件，文件解析失败等）时，抛出异常。
