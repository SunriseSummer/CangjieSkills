<!-- cj-doc kind="api-member" level="6" id="stdx.compress.class.targzip.archive" parent="stdx.compress.class.targzip" -->
# TarGzip.archive

[← TarGzip](index.md)

本页汇总 6 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
public static func archive(fromDir!: Path, filter!: (Path) -> Bool, destFile!: Path, includeBaseDirectory!: Bool): Unit
```

配合过滤函数选择性地将指定目录压缩为 .tar.gz 文件。内部先以 tar 格式归档目录，再以 gzip 压缩归档结果。

## 参数

- fromDir!: Path - 待压缩目录。

- filter!: (Path) -> Bool - 过滤函数，会传入遍历到的目录、文件和软链接路径，返回 true 表示保留，否则丢弃。

- destFile!: Path - 输出的 .tar.gz 文件路径。

- includeBaseDirectory!: Bool - 是否包含根目录。

## 异常

- TarException - 如果 tar 归档时发生错误，抛出异常。

- ZlibException - 如果 zlib 压缩时发生错误，抛出异常。

## 重载 2

### 签名

```cangjie role=signature
public static func archive(fromDir!: Path, destFile!: Path, includeBaseDirectory!: Bool): Unit
```

将指定目录压缩为 .tar.gz 文件。内部先以 tar 格式归档目录，再以 gzip 压缩归档结果。

## 参数

- fromDir!: Path - 待压缩的目录路径。

- destFile!: Path - 生成的 .tar.gz 文件路径。

- includeBaseDirectory!: Bool - 是否包含目录本身作为顶级目录。若为 true，归档包内包含该目录；若为 false，仅包含其内容。

## 异常

- TarException - 如果 tar 归档时发生错误，抛出异常。

- ZlibException - 如果 zlib 压缩时发生错误，抛出异常。

## 重载 3

### 签名

```cangjie role=signature
public static func archive(fromDir!: String, filter!: (String) -> Bool, destFile!: String, includeBaseDirectory!: Bool): Unit
```

配合过滤函数选择性地将指定目录压缩为 .tar.gz 文件。内部先以 tar 格式归档目录，再以 gzip 压缩归档结果。

## 参数

- fromDir!: String - 待压缩目录。

- filter!: (String) -> Bool - 过滤函数，会传入遍历到的目录、文件和软链接路径，返回 true 表示保留，否则丢弃。

- destFile!: String - 输出的 .tar.gz 文件路径。

- includeBaseDirectory!: Bool - 是否包含根目录。

## 异常

- TarException - 如果 tar 归档时发生错误，抛出异常。

- ZlibException - 如果 zlib 压缩时发生错误，抛出异常。

## 重载 4

### 签名

```cangjie role=signature
public static func archive(fromDir!: String, destFile!: String, includeBaseDirectory!: Bool): Unit
```

将指定目录压缩为 .tar.gz 文件。内部先以 tar 格式归档目录，再以 gzip 压缩归档结果。

## 参数

- fromDir!: String - 待压缩的目录路径。

- destFile!: String - 生成的 .tar.gz 文件路径。

- includeBaseDirectory!: Bool - 是否包含目录本身作为顶级目录。若为 true，归档包内包含该目录；若为 false，仅包含其内容。

## 异常

- TarException - 如果 tar 归档时发生错误，抛出异常。

- ZlibException - 如果 zlib 压缩时发生错误，抛出异常。

## 重载 5

### 签名

```cangjie role=signature
public static func archive<T>(fromDir!: Path, destStream!: T, includeBaseDirectory!: Bool): Unit where T <: OutputStream
```

将目录压缩为 .tar.gz 数据并写入指定输出流。

## 注意
>
函数不负责 destStream 资源的释放，调用方需自行管理该输出流的生命周期。

## 参数

- fromDir!: Path - 待压缩的目录路径。

- destStream!: T - 压缩后数据的输出流。

- includeBaseDirectory!: Bool - 是否包含根目录。

## 异常

- TarException - 如果 tar 归档时发生错误，抛出异常。

- ZlibException - 如果 zlib 压缩时发生错误，抛出异常。

## 重载 6

### 签名

```cangjie role=signature
public static func archive<T>(fromDir!: String, destStream!: T, includeBaseDirectory!: Bool): Unit where T <: OutputStream
```

将目录压缩为 .tar.gz 数据并写入指定输出流。

## 注意
>
函数不负责 destStream 资源的释放，调用方需自行管理该输出流的生命周期。

## 参数

- fromDir!: String - 待压缩的目录路径。

- destStream!: T - 压缩后数据的输出流。

- includeBaseDirectory!: Bool - 是否包含根目录。

## 异常

- TarException - 如果 tar 归档时发生错误，抛出异常。

- ZlibException - 如果 zlib 压缩时发生错误，抛出异常。

