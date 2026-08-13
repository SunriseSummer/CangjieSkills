<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.operator-add" parent="std.time.struct.datetime" -->
# DateTime.+

[← DateTime](index.md)

## 签名

```cangjie role=signature
public operator func +(r: Duration): DateTime
```

实现 DateTime 类型和 Duration 类型加法，即 DateTime + Duration 运算。

## 契约

参数：

- r: Duration - 加法的右操作数。

返回值：

- DateTime - DateTime 类型实例和 `r` 的和。

异常：

- ArithmeticException - 当结果超过日期时间的表示范围时，抛出异常。
