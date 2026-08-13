<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.cstring.subcstring" parent="std.core.intrinsic.cstring.extension.extend-cstring-tostring" -->
# CString.subCString

[← extend CString <: ToString](extensions/extend-cstring-tostring.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func subCString(UIntNative)

### 签名

```cangjie role=signature
public func subCString(beginIndex: UIntNative): CString
```

截取指定位置开始至字符串结束的子串。

### 契约

> **注意：**
>
> 1. 该接口返回为字符串的副本，返回的子串使用完后需要手动 free。
> 2. 如果 beginIndex 与字符串长度相等，将返回空指针。

参数：

- beginIndex: UIntNative - 截取的起始位置，取值范围为 [0, this.size()]。

返回值：

- CString - 截取的子串。

异常：

- IndexOutOfBoundsException - 如果 beginIndex 大于字符串长度，抛出异常。
- IllegalMemoryException - 如果内存申请失败或内存拷贝失败时，抛出异常。

## func subCString(UIntNative, UIntNative)

### 签名

```cangjie role=signature
public func subCString(beginIndex: UIntNative, subLen: UIntNative): CString
```

截取字符串的子串，指定起始位置和截取长度。

### 契约

如果截取的末尾位置超出字符串长度，截取至字符串末尾。

> **注意：**
>
> 1. 该接口返回为字符串的副本，返回的子串使用完后需要手动 free。
> 2. 如果 beginIndex 等于于字符串长度，或 subLen 等于 0，返回空指针。

参数：

- beginIndex: UIntNative - 截取的起始位置，取值范围为 [0, this.size()]。
- subLen: UIntNative - 截取长度，取值范围为 0, [UIntNative.Max]。

返回值：

- CString - 截取的子串。

异常：

- IndexOutOfBoundsException - 如果 beginIndex 大于字符串长度，抛出异常。
- IllegalMemoryException - 如果内存申请失败或内存拷贝失败时，抛出异常。
