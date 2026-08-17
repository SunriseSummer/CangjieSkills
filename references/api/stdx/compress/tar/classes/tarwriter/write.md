<!-- cj-doc kind="api-member" level="6" id="stdx.compress.tar.class.tarwriter.write" parent="stdx.compress.tar.class.tarwriter" -->
# TarWriter.write

[← TarWriter](index.md)

本页汇总 5 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
public func write(info: FileInfo, entryName!: String): Unit
```

将指定文件、目录、软链接写入到内部流中。

## 参数

- info: FileInfo - 待写入的文件、目录、软链接信息。

- entryName!: String - tar 文件中的条目名。

## 异常

- TarException - 如果写入已结束，或者创建或写入条目失败，则抛出异常。

- FSException - 如果创建文件流失败，则抛出异常。

## 重载 2

### 签名

```cangjie role=signature
public func write(it: Iterable<TarEntry>): Unit
```

将指定 tar 文件条目列表写入到内部流中。

## 参数

- it: Iterable<TarEntry> - 待写入的 tar 文件条目列表。

## 异常

- TarException - 如果写入已结束，或者写入条目失败，则抛出异常。

## 重载 3

### 签名

```cangjie role=signature
public func write(path: Path, entryName!: String): Unit
```

将指定文件、目录、软链接写入到内部流中。

## 参数

- path: Path - 指定文件、目录、软链接路径。

- entryName!: String - tar 文件中的条目名。

## 异常

- TarException - 如果写入已结束，或者创建或写入条目失败，则抛出异常。

- FSException - 如果创建文件流失败，则抛出异常。

## 重载 4

### 签名

```cangjie role=signature
public func write(path!: String, entryName!: String): Unit
```

将指定文件、目录、软链接写入到内部流中。

## 参数

- path!: String - 指定文件、目录、软链接的路径。

- entryName!: String - tar 文件中的条目名。

## 异常

- TarException - 如果写入已结束，或者创建或写入条目失败，则抛出异常。

- FSException - 如果创建文件流失败，则抛出异常。

## 重载 5

### 签名

```cangjie role=signature
public func write(entry: TarEntry): Unit
```

将指定 tar 文件条目写入到内部流中。

## 参数

- entry: TarEntry - 待写入的 tar 文件条目。

## 异常

- TarException - 如果写入已结束，或者写入条目失败，则抛出异常。

