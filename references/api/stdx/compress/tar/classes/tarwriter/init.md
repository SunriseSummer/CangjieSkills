<!-- cj-doc kind="api-member" level="6" id="stdx.compress.tar.class.tarwriter.init" parent="stdx.compress.tar.class.tarwriter" -->
# TarWriter.init

[← TarWriter](index.md)

本页汇总 2 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
public init(stream: T)
```

从指定的流中创建一个 tar 文件写入器，默认为 Pax 格式。

## 参数

- stream: T - 指定的输出流。

## 重载 2

### 签名

```cangjie role=signature
public init(stream: T, format: TarEntryFormat)
```

从指定的流中创建一个 tar 文件写入器。

## 参数

- stream: T - 指定的输出流。

- format: TarEntryFormat - tar 文件的条目格式。

