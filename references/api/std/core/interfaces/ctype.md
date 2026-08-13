<!-- cj-doc kind="api-type" level="5" id="std.core.interface.ctype" parent="std.core" -->
# CType

[← std.core](../index.md)

`sealed CType`

表示支持与 C 语言互操作的接口。

## 契约

CType 接口是一个语言内置的空接口，它是 CType 约束的具体实现，所有 C 互操作支持的类型都隐式地实现了该接口，因此所有 C 互操作支持的类型都可以作为 CType 类型的子类型使用。

> **注意：**
>
> - CType 接口是仓颉中的一个接口类型，它本身不满足 CType 约束。
> - CType 接口不允许被用户继承、扩展。
> - CType 接口不会突破子类型的使用限制。

示例：

<!-- run -->
