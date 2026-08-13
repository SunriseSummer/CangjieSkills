<!-- cj-doc kind="api-member" level="6" id="std.ast.class.tokensiterator.seeing" parent="std.ast.class.tokensiterator" -->
# TokensIterator.seeing

[← TokensIterator](index.md)

## 签名

```cangjie role=signature
public func seeing(kind: TokenKind): Bool
```

判断当前节点的 Token 类型是否是传入的类型。

## 契约

参数：

- kind: TokenKind - 需要判断的 TokenKind 类型。

返回值：

- Bool - 如果当前节点的 TokenKind 与传入类型相同，返回 true，否则返回 false。
