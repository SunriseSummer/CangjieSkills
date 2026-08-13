<!-- cj-doc kind="api-member" level="6" id="std.collection.class.treeset.of" parent="std.collection.class.treeset" -->
# TreeSet<T> where T <: Comparable<T>.of

[← TreeSet<T> where T <: Comparable<T>](index.md)

## 签名

```cangjie role=signature
public static func of(elements: Array<T>): TreeSet<T>
```

构造一个包含指定数组中所有元素的 TreeSet。

## 契约

按照 elements 的先后顺序将元素插入到 TreeSet 内，由于 TreeSet 中不允许出现相同的元素，如果 elements 中有多个相同的元素时，TreeSet 只会保留一个元素。

参数：

- elements: Array\<T> - 传入数组，变长参数语法支持参数省略数组字面量的 `[]` 。

返回值：

- TreeSet\<T> - 元素为 T 类型的 TreeSet。

> **说明：**
>
> 此函数的参数可使用变长参数方式提供，例如： `TreeSet.of(1, 2, 3)` 等价于 `TreeSet.of([1, 2, 3])` 。
