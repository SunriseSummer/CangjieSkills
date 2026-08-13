<!-- cj-doc kind="api-member" level="6" id="std.collection.class.arraylist.of" parent="std.collection.class.arraylist" -->
# ArrayList<T>.of

[← ArrayList<T>](index.md)

## 签名

```cangjie role=signature
public static func of(elements: Array<T>): ArrayList<T>
```

构造一个包含指定数组中所有元素的 ArrayList。

## 契约

参数：

- elements: Array\<T> - 传入数组，变长参数语法支持参数省略数组字面量的 `[]` 。

返回值：

- ArrayList\<T> - 元素为 T 类型的 ArrayList。

> **说明：**
>
> 此函数的参数可使用变长参数方式提供，例如： `ArrayList.of(1, 2, 3)` 等价于 `ArrayList.of([1, 2, 3])` 。
