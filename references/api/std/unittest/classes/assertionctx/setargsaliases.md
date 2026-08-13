<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.assertionctx.setargsaliases" parent="std.unittest.class.assertionctx" -->
# AssertionCtx.setArgsAliases

[← AssertionCtx](index.md)

## 签名

```cangjie role=signature
public func setArgsAliases(aliases: Array<String>): Unit
```

设置别名以通过函数 `arg` 访问未解析的用户定义的断言函数参数。

## 契约

功能：设置别名以通过函数 `arg` 访问未解析的用户定义的断言函数参数。框架内部使用，用户无需使用该函数。

参数：

- aliases: Array\<String> - 标识符数组。数组的大小应与参数列表匹配（除 `AssertionCtx` 外）。
