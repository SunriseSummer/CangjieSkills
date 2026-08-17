<!-- cj-doc kind="api-member" level="6" id="stdx.compress.class.targzip.extract" parent="stdx.compress.class.targzip" -->
# TarGzip.extract

[← TarGzip](index.md)

本页汇总 4 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
public static func extract(fromTarGzip!: Path, destDir!: Path, overwrite!: Bool): Unit
```

将 .tar.gz 文件解压至指定目录。内部先以 gzip 解压缩，再以 tar 解包。

## 参数

- fromTarGzip!: Path - 待解压的 .tar.gz 文件路径。

- destDir!: Path - 解压目标目录。

- overwrite!: Bool - 若为 true，允许覆盖已存在文件、目录；否则遇到重名文件、目录将抛出异常。

## 异常

- TarException - 如果 tar 提取时发生错误，抛出异常。

- ZlibException - 如果 zlib 解压时发生错误，抛出异常。

## 重载 2

### 签名

```cangjie role=signature
public static func extract(fromTarGzip!: String, destDir!: String, overwrite!: Bool): Unit
```

将 .tar.gz 文件解压至指定目录。内部先以 gzip 解压缩，再以 tar 解包。

## 参数

- fromTarGzip!: String - 待解压的 .tar.gz 文件路径。

- destDir!: String - 解压目标目录。

- overwrite!: Bool - 若为 true，允许覆盖已存在文件、目录；否则遇到重名文件、目录将抛出异常。

## 异常

- TarException - 如果 tar 提取时发生错误，抛出异常。

- ZlibException - 如果 zlib 解压时发生错误，抛出异常。

## 重载 3

### 签名

```cangjie role=signature
public static func extract<T>(fromStream!: T, destDir!: Path, overwrite!: Bool): Unit where T <: InputStream
```

将 .tar.gz 数据从输入流中读取并解压至指定目录。

## 参数

- fromStream!: T - 待解压的 .tar.gz 数据输入流。

- destDir!: Path - 解压目标目录。

- overwrite!: Bool - 若为 true，允许覆盖已存在文件、目录；否则遇到重名文件、目录将抛出异常。

## 异常

- TarException - 如果 tar 提取时发生错误，抛出异常。

- ZlibException - 如果 zlib 解压时发生错误，抛出异常。

## 重载 4

### 签名

```cangjie role=signature
public static func extract<T>(fromStream!: T, destDir!: String, overwrite!: Bool): Unit where T <: InputStream
```

将 .tar.gz 数据从输入流中读取并解压至指定目录。

## 参数

- fromStream!: T - 待解压的 .tar.gz 数据输入流。

- destDir!: String - 解压目标目录。

- overwrite!: Bool - 若为 true，允许覆盖已存在文件、目录；否则遇到重名文件、目录将抛出异常。

## 异常

- TarException - 如果 tar 提取时发生错误，抛出异常。

- ZlibException - 如果 zlib 解压时发生错误，抛出异常。

