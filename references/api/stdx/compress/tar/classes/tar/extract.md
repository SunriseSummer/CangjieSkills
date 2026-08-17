<!-- cj-doc kind="api-member" level="6" id="stdx.compress.tar.class.tar.extract" parent="stdx.compress.tar.class.tar" -->
# Tar.extract

[← Tar](index.md)

本页汇总 4 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
public static func extract(fromTar!: Path, destDir!: Path, overwrite!: Bool): Unit
```

将 .tar 文件提取至指定目录。

## 参数

- fromTar!: Path - 待提取的 .tar 文件路径。

- destDir!: Path - 提取目标目录。

- overwrite!: Bool - 若为 true，允许覆盖已存在文件、目录；否则遇到重名文件、目录将抛出异常。

## 异常

- TarException - 如果 tar 提取时发生错误，抛出异常。

## 重载 2

### 签名

```cangjie role=signature
public static func extract(fromTar!: String, destDir!: String, overwrite!: Bool): Unit
```

将 .tar 文件提取至指定目录。

## 参数

- fromTar!: String - 待提取的 .tar 文件路径。

- destDir!: String - 提取目标目录。

- overwrite!: Bool - 若为 true，允许覆盖已存在文件、目录；否则遇到重名文件、目录将抛出异常。

## 异常

- TarException - 如果 tar 提取时发生错误，抛出异常。

## 重载 3

### 签名

```cangjie role=signature
public static func extract<T>(fromStream!: T, destDir!: Path, overwrite!: Bool): Unit where T <: InputStream
```

将 .tar 数据从输入流中读取并提取至指定目录。

## 参数

- fromStream!: T - 待提取的 .tar 数据输入流。

- destDir!: Path - 提取目标目录。

- overwrite!: Bool - 若为 true，允许覆盖已存在文件、目录；否则遇到重名文件、目录将抛出异常。

## 异常

- TarException - 如果 tar 提取时发生错误，抛出异常。

## 重载 4

### 签名

```cangjie role=signature
public static func extract<T>(fromStream!: T, destDir!: String, overwrite!: Bool): Unit where T <: InputStream
```

将 .tar 数据从输入流中读取并提取至指定目录。

## 参数

- fromStream!: T - 待提取的 .tar 数据输入流。

- destDir!: String - 提取目标目录。

- overwrite!: Bool - 若为 true，允许覆盖已存在文件、目录；否则遇到重名文件、目录将抛出异常。

## 异常

- TarException - 如果 tar 提取时发生错误，抛出异常。

