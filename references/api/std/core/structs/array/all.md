<!-- cj-doc kind="api-member" level="6" id="std.core.struct.array.all" parent="std.core.struct.array" -->
# Array<T>.all

[← Array<T>](index.md)

## 签名

```cangjie role=signature
public func all(predicate: (T) -> Bool): Bool
```

判断数组所有元素是否都满足条件。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- predicate: (T) -> Bool - 给定的条件。

## 返回值

- Bool - 如果数组所有元素都满足条件，返回 true，否则返回 false

