<!-- cj-doc kind="api-member" level="6" id="std.core.struct.array.step" parent="std.core.struct.array" -->
# Array<T>.step

[← Array<T>](index.md)

## 签名

```cangjie role=signature
public func step(count: Int64): Array<T>
```

以指定的间隔从数组中提取元素，并返回一个新数组。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- count: Int64 - 选取的间隔

## 返回值

- Array<T> - 一个新的数组，包含了按间隔从源数组中提取出的所有元素。

## 异常

- IllegalArgumentException - 当 count <= 0 时，抛出异常。

