<!-- cj-doc kind="api-type" level="5" id="std.core.class.exclusivescopeexception" parent="std.core" -->
# ExclusiveScopeException

[← std.core](../../index.md)

`class ExclusiveScopeException <: Exception`

自定义异常类，用于包装在独占作用域中抛出的异常。它保留了原始异常的堆栈信息，不支持主动构造该异常，但是可以被捕获到。

## 方法

| 签名 | 功能 |
|---|---|
| [`override func toString(): String`](tostring.md) | 获得类名。 |

