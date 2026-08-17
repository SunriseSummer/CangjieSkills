<!-- cj-doc kind="api-member" level="6" id="stdx.string_intern.interface.internable.intern" parent="stdx.string_intern.interface.internable" -->
# Internable.intern

[← Internable](index.md)

本页汇总 2 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
static func intern(array: Array<Byte>): String
```

获取与输入数组内容一致的已经被缓存起来的字符串对象。

## 参数

- array: Array<Byte> - 运行时创建的 Byte 数组，该数组计划用于创建一个字符串。

## 返回值

- String - 在缓存池中的字符串对象，该字符串对象的 Byte 数组表示与入参一致。

## 重载 2

### 签名

```cangjie role=signature
static func intern(str: String): String
```

获取与输入字符串内容一致的已经被缓存起来的字符串对象。

## 参数

- str: String - 运行时创建的字符串。

## 返回值

- String - 在缓存池中的字符串对象。

