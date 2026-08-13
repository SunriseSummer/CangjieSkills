<!-- cj-doc kind="api-member" level="7" id="std.core.class.box.operator-ge" parent="std.core.class.box.extension.extend-t-box-t-comparable-box-t-where-t-comparable-t" -->
# Box<T>.>=

[← extend<T> Box<T> <: Comparable<Box<T>> where T <: Comparable<T>](extensions/extend-t-box-t-comparable-box-t-where-t-comparable-t.md)

## 签名

```cangjie role=signature
public operator func >=(that: Box<T>): Bool
```

比较 Box 对象的大小。

## 契约

参数：

- that: Box\<T> - 比较的另外一个 Box 对象。

返回值：

- Bool - 当前 Box 对象大于等于参数 Box 对象返回 true，否则返回 false。
