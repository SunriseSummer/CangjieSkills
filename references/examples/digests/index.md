<!-- cj-doc kind="example-category" level="3" id="examples.digests" parent="examples" -->
# 数据摘要

[← 应用示例](../index.md)

以通用摘要接口或具体 SHA-256 实现计算固定长度的数据指纹。

| 示例 | 教学目标 |
|---|---|
| [对字节数组计算摘要](digest-array.md) | 把具体 Digest 实现传给标准库便捷函数，分离协议与算法实现。 |
| [流式计算 SHA-256](sha256.md) | 用 stdx SHA256 分段 write、finish，并在复用前 reset。 |
