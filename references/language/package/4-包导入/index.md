<!-- cj-doc kind="guide-index" level="4" id="language.package.4-包导入" parent="language.package" -->
# 4. 包导入

[← 包与导入](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [4.1 语法](4-1-语法.md) | `import` 可导入单个声明、同包内多个声明或通配导入；组合导入可在一条语句中引入多个包。 |
| [4.2 规则](4-2-规则.md) | 须在 `package` 之后、其他声明之前 |
| [4.3 遮蔽与重载](4-3-遮蔽与重载.md) | 导入的名称被同名本地声明遮蔽（除非构成函数重载，此时适用重载解析） |
| [4.4 隐式 core 导入](4-4-隐式-core-导入.md) | `String`、`Range` 等可用是因为 `core` 包被自动导入 |
| [4.5 import as（重命名导入）](4-5-import-as-重命名导入.md) | 重命名导入以解决冲突：`import pkg.name as newName`、`import pkg as alias` |
| [4.6 重新导出](4-6-重新导出.md) | `public import`、`protected import`、`internal import` 重新导出导入的成员 |
