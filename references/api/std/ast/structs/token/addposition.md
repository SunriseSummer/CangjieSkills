<!-- cj-doc kind="api-member" level="6" id="std.ast.struct.token.addposition" parent="std.ast.struct.token" -->
# Token.addPosition

[← Token](index.md)

## 签名

```cangjie role=signature
public func addPosition(fileID: UInt32, line: Int32, colum: Int32): Token
```

补充词法单元的位置信息。

## 契约

参数：

- fileID: UInt32 - Token 所在的 fileID。
- line: Int32 - Token 所在的行号。
- colum: Int32 - Token 所在的列号。

返回值：

- Token - 补充完位置信息后的 Token 对象。
