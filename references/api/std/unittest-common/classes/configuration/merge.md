<!-- cj-doc kind="api-member" level="6" id="std.unittest.common.class.configuration.merge" parent="std.unittest.common.class.configuration" -->
# Configuration.merge

[← Configuration](index.md)

## 签名

```cangjie role=signature
public static func merge(parent: Configuration, child: Configuration): Configuration
```

合并 child 到 parent 配置中。

## 契约

功能：合并 child 到 parent 配置中。其中如有同名键值 child 覆盖 parent 。

参数：

- parent: Configuration - 需要合并的配置
- child: Configuration - 需要合并的配置

返回值：

- Configuration - 合并完成的配置
