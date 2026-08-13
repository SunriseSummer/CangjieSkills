<!-- cj-doc kind="api-member" level="6" id="std.ast.struct.position.init" parent="std.ast.struct.position" -->
# Position.init

[← Position](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

构造一个默认的 Position 实例，其中 `fileID`、`line`、`column` 成员变量均为 `0`。

## init(UInt32, Int32, Int32)

### 签名

```cangjie role=signature
public init(fileID: UInt32, line: Int32, column: Int32)
```

构造一个 Position 实例。

### 契约

参数：

- fileID: UInt32 - 文件 ID。
- line: Int32 - 行号。
- column: Int32 - 列号。
