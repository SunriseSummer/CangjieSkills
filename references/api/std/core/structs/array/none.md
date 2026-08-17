<!-- cj-doc kind="api-member" level="6" id="std.core.struct.array.none" parent="std.core.struct.array" -->
# Array<T>.none

[← Array<T>](index.md)

## 签名

```cangjie role=signature
public func none(predicate: (T) -> Bool): Bool
```

判断数组中所有元素是否都不满足条件。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- predicate: (T) -> Bool - 给定的条件。

## 返回值

- Bool - 当前数组中元素是否都不满足条件。

