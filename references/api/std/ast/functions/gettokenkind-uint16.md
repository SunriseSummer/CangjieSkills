<!-- cj-doc kind="api-member" level="5" id="std.ast.func.gettokenkind-uint16" parent="std.ast" -->
# getTokenKind(UInt16)

[← std.ast](../index.md)

## 签名

```cangjie role=signature
public func getTokenKind(no: UInt16): TokenKind
```

将词法单元种类序号转化为 TokenKind。

## 契约

参数：

- no: UInt16 - 需要转换的序号。

返回值：

- TokenKind - 词法单元种类序号对应的 TokenKind。

> **注意：**
>
> 当前 SINGLE_QUOTED_STRING_LITERAL 和 STRING_LITERAL 共用序号 147，输入序号 147 只能获得 STRING_LITERAL，其他 TokenKind 无共用序号情况。
