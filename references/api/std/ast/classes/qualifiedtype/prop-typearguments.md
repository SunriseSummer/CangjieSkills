<!-- cj-doc kind="api-member" level="6" id="std.ast.class.qualifiedtype.prop-typearguments" parent="std.ast.class.qualifiedtype" -->
# QualifiedType.typeArguments

[← QualifiedType](index.md)

## 签名

```cangjie role=signature
public mut prop typeArguments: ArrayList<TypeNode>
```

获取或设置 QualifiedType 节点中的实例化类型的列表，如 `T.a<Int32>` 中的 Int32，列表可能为空。

## 契约

类型：ArrayList\<TypeNode>
