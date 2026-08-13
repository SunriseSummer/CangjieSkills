<!-- cj-doc kind="api-member" level="6" id="std.database.sql.interface.queryresult.next" parent="std.database.sql.interface.queryresult" -->
# QueryResult.next

[← QueryResult](index.md)

## 签名

```cangjie role=signature
func next(): Bool
```

向后移动一行，必须先调用一次 `next()` 才能移动到第一行，第二次调用移动到第二行，依此类推。

## 契约

功能：向后移动一行，必须先调用一次 `next()` 才能移动到第一行，第二次调用移动到第二行，依此类推。当返回 `true` 时，驱动会在结果集的当前行填入数据，当返回 `false` 时结束，且不会修改结果集当前行的内容。

返回值：

- Bool - 下一行存在数据则返回 `true`，否则返回 `false`。
