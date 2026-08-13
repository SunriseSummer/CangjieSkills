<!-- cj-doc kind="api-member" level="5" id="std.unittest.func.isnearexpansion" parent="std.unittest" -->
# isNearExpansion

[← std.unittest](../index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## isNearExpansion<CT, D>(CT, CT, D, String)

### 签名

```cangjie role=signature
public func isNearExpansion<CT, D>(
    l: CT,
    r: CT,
    delta!: D,
    cmpType!: String
): Bool where CT <: NearEquatable<CT, D> & Comparable<CT>
```

判断两个参数是否近似相等。

### 契约

功能：判断两个参数是否近似相等。在 PowerAssert 宏展开时使用。用户不应使用。

参数：

- l: CT - 待判断近似相等的参数。
- r: CT - 待判断近似相等的参数。
- delta!: D - 待判断近似相等时使用的 delta。
- cmpType!: String - 判断的类型。

返回值：

- Bool - 是否近似相等。

## isNearExpansion<CT, D>(CT, CT, D, String, Bool)

### 签名

```cangjie role=signature
public func isNearExpansion<CT, D>(
    l: CT,
    r: CT,
    delta!: D,
    cmpType!: String,
    overloadHack!: Bool = true
): Bool where CT <: NearEquatable<CT, D>
```

判断两个参数是否近似相等。

### 契约

功能：判断两个参数是否近似相等。在 PowerAssert 宏展开时使用。用户不应使用。

参数：

- l: CT - 待判断近似相等的参数。
- r: CT - 待判断近似相等的参数。
- delta!: D - 待判断近似相等时使用的 delta。
- cmpType!: String - 判断的类型。
- overloadHack!: Bool - 为使能函数重载使用新增的参数，默认值为 true 。

返回值：

- Bool - 是否近似相等。
