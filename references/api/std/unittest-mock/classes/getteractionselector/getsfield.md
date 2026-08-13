<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.getteractionselector.getsfield" parent="std.unittest.mock.class.getteractionselector" -->
# GetterActionSelector<TRet>.getsField

[← GetterActionSelector<TRet>](index.md)

## 签名

```cangjie role=signature
public func getsField(field: SyntheticField<TRet>): CardinalitySelector<GetterActionSelector<TRet>>
```

读取合成字段。

## 契约

参数：

- field: SyntheticField\<TRet> - 合成字段，处理可变属性。

返回值：

- CardinalitySelector\<GetterActionSelector\<TRet>> - 预期执行次数的操作器。
