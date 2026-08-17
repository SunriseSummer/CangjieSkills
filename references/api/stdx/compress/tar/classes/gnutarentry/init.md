<!-- cj-doc kind="api-member" level="6" id="stdx.compress.tar.class.gnutarentry.init" parent="stdx.compress.tar.class.gnutarentry" -->
# GnuTarEntry.init

[← GnuTarEntry](index.md)

本页汇总 2 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
public init(path: Path)
```

从文件、目录、软链接构造一个 Gnu tar 文件条目。

## 参数

- path: Path - 文件、目录、软链接的路径。

## 异常

- TarException - 如果 path 参数指定的目标不存在或不是文件、目录、软链接，则抛出异常。

- FSException - 如果读取目标信息或创建目标文件流失败，则抛出异常。

## 重载 2

### 签名

```cangjie role=signature
public init(path: String)
```

从文件、目录、软链接构造一个 Gnu tar 文件条目。

## 参数

- path: String - 文件、目录、软链接的路径。

## 异常

- TarException - 如果 path 参数指定的目标不存在或不是文件、目录、软链接，则抛出异常。

- FSException - 如果读取目标信息或创建目标文件流失败，则抛出异常。

