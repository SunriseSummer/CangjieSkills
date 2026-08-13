<!-- cj-doc kind="api-member" level="5" id="std.ast.func.comparetokens-tokens-tokens" parent="std.ast" -->
# compareTokens(Tokens, Tokens)

[← std.ast](../index.md)

## 签名

```cangjie role=signature
public func compareTokens(tokens1: Tokens, tokens2: Tokens): Bool
```

用于比较两个 Tokens 是否一致。

## 契约

参数：

- tokens1: Tokens - 需要比较的第一个 Tokens。
- tokens2: Tokens - 需要比较的第二个 Tokens。

返回值：

- Bool - 如果两个 Tokens 内容相同（除了换行符、结束符和位置信息）则返回 `true`。
