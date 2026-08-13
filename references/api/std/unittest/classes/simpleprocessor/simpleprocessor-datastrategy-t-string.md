<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.simpleprocessor.simpleprocessor-datastrategy-t-string" parent="std.unittest.class.simpleprocessor" -->
# SimpleProcessor<T>.SimpleProcessor(() -> DataStrategy<T>, String)

[← SimpleProcessor<T>](index.md)

## 签名

```cangjie role=signature
public SimpleProcessor(let buildDelegate:() -> DataStrategy<T>, let name: String)
```

SimpleProcessor 构造函数。

## 契约

参数：

- buildDelegate: () -> DataStrategy\<T> - 生成数据策略的闭包。
- name: String - 处理器名称。
