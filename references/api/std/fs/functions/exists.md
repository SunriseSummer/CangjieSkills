<!-- cj-doc kind="api-member" level="5" id="std.fs.func.exists" parent="std.fs" -->
# exists

[← std.fs](../index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## exists(Path)

### 签名

```cangjie role=signature
public func exists(path: Path): Bool
```

判断目标地址是否存在。

### 契约

参数：

- path: Path - 待判断的目标地址。

返回值：

- Bool - 目标地址是否存在。

异常：

- IllegalArgumentException - 路径为空或包含字符串结束符时抛出异常。

## exists(String)

### 签名

```cangjie role=signature
public func exists(path: String): Bool
```

判断目标地址是否存在。

### 契约

参数：

- path: String - 待判断的目标地址。

返回值：

- Bool - 目标地址是否存在。

异常：

- IllegalArgumentException - 路径为空或包含字符串结束符时抛出异常。
