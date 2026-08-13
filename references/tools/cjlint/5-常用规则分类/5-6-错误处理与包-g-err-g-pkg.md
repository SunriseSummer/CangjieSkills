<!-- cj-doc kind="guide-leaf" level="5" id="tools.cjlint.5-常用规则分类.5-6-错误处理与包-g-err-g-pkg" parent="tools.cjlint.5-常用规则分类" -->
# 5.6 错误处理与包（G.ERR/G.PKG）

[← 5. 常用规则分类](index.md)

速查`G.ERR.01`：恰当使用异常或错误处理机制；`G.ERR.02`：防止通过异常抛出的内容泄露敏感信息；`G.ERR.03`：避免对 Option 类型使用 `getOrThrow`；另含更多表项。

| 规则 | 说明 |
|------|------|
| G.ERR.01 | 恰当使用异常或错误处理机制 |
| G.ERR.02 | 防止通过异常抛出的内容泄露敏感信息 |
| G.ERR.03 | 避免对 Option 类型使用 `getOrThrow` |
| G.ERR.04 | 不要在 `finally` 块中使用 `return`/`break`/`continue` 或抛异常 |
| G.PKG.01 | 避免在 `import` 声明中使用通配符 `*` |
