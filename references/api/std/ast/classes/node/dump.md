<!-- cj-doc kind="api-member" level="6" id="std.ast.class.node.dump" parent="std.ast.class.node" -->
# Node.dump

[← Node](index.md)

## 签名

```cangjie role=signature
public func dump(): Unit
```

将当前语法树节点转化为树形结构的形态并进行打印。

## 契约

语法树节点的树形结构将按照以下形式进行输出：

- `-` 字符串：表示当前节点的公共属性， 如 `-keyword` , `-identifier`。
- 节点属性后紧跟该节点的具体类型， 如 `-declType: PrimitiveType` 表示节点类型是一个 PrimitiveType 节点。
- 每个类型使用大括号表示类型的作用区间。

语法树输出的详细格式请参见语法树节点打印。
