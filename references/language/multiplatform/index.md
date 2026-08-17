<!-- cj-doc kind="guide-topic" level="3" id="language.multiplatform" parent="language" -->
# 跨平台开发

[← 语言特性](../index.md)

仓颉 1.1.3 的实验性跨平台模型把同一包拆成公共源码与平台源码，并以 feature/source-set 选择目标实现。

| 规则/任务 | 摘要 |
|---|---|
| [1. common 与 specific 声明](1-common-与-specific-声明.md) | 公共声明给出跨平台契约，平台声明提供签名匹配的目标实现。 |
| [2. feature 与 source-set 构建](2-feature-与-source-set-构建.md) | 在实验模式下声明源码集，并用目标或显式 feature 选择产品源码集。 |
| [3. 编译流水线与移动端交叉编译](3-编译流水线与移动端交叉编译.md) | 直接使用 cjc 时先生成公共 CHIR/CJO，再编译平台部分；Android/iOS 还需目标 SDK。 |
