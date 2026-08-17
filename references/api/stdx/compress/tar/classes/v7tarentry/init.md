<!-- cj-doc kind="api-member" level="6" id="stdx.compress.tar.class.v7tarentry.init" parent="stdx.compress.tar.class.v7tarentry" -->
# V7TarEntry.init

[← V7TarEntry](index.md)

本页汇总 2 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
public init(filePath: Path)
```

从文件、目录、软链接构造一个 V7 tar 文件条目。

## 参数

- filePath: Path - 文件、目录、软链接的路径。

## 异常

- TarException - 如果 filePath 参数指定的目标不存在或不是文件、目录、软链接，则抛出异常。

- FSException - 如果读取目标信息或创建目标文件流失败，则抛出异常。

## 重载 2

### 签名

```cangjie role=signature
public init(filePath: String)
```

从文件、目录、软链接构造一个 V7 tar 文件条目。

## 参数

- filePath: String - 文件、目录、软链接的路径。

## 异常

- TarException - 如果 filePath 参数指定的目标不存在或不是文件、目录、软链接，则抛出异常。

- FSException - 如果读取目标信息或创建目标文件流失败，则抛出异常。

