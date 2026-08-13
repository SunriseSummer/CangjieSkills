<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.setteractionselector.setsfield" parent="std.unittest.mock.class.setteractionselector" -->
# SetterActionSelector<TRet>.setsField

[← SetterActionSelector<TRet>](index.md)

## 签名

```cangjie role=signature
public func setsField(field: SyntheticField<TArg>): CardinalitySelector<SetterActionSelector<TArg>>
```

设置合成字段。

## 契约

参数：

- field: SyntheticField\<TArg> - 合成字段，处理可变属性。

返回值：

- CardinalitySelector\<SetterActionSelector\<TArg>> - 预期执行次数的操作器。
