<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.operator-sub" parent="std.time.struct.datetime" -->
# DateTime.-

[← DateTime](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## operator func -(DateTime)

### 签名

```cangjie role=signature
public operator func -(r: DateTime): Duration
```

实现 DateTime 类型之间的减法，即 DateTime - DateTime 运算。

### 契约

参数：

- r: DateTime - 减法的右操作数。

返回值：

- Duration - DateTime 类型实例和 `r` 的差。

## operator func -(Duration)

### 签名

```cangjie role=signature
public operator func -(r: Duration): DateTime
```

实现 DateTime 类型和 Duration 类型减法，即 DateTime - Duration 运算。

### 契约

参数：

- r: Duration - 减法的右操作数。

返回值：

- DateTime - DateTime 类型实例和 `r` 的差。

异常：

- ArithmeticException - 当结果超过日期时间的表示范围时，抛出异常。
