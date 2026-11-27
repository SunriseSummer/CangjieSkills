# 可选的 INT8 BGE 语义检索实验

此目录描述独立于 C++ 默认检索器的语义路线。模型只编码查询，文档向量预先生成；查询过程不调用模型服务，不下载文件，不需要 GPU。它需要 Python 与可选依赖，不能描述成“无依赖 C++ 模型”。

## 安装与构建

从仓库根目录运行：

```sh
python -m pip install -r native/doc_router/semantic/requirements.txt
python scripts/maintenance/build_router.py
python scripts/maintenance/build_semantic_router.py --download
python scripts/maintenance/build_semantic_router.py --check
```

只有显式的 `--download` 会联网，下载地址固定到 `model-lock.json` 的提交，逐文件核对长度和 SHA-256。已经下载的正确文件不会重复下载。构建也可以不传 `--download`，此时要求文件已经在输出目录的 `model/` 下。生成物在忽略的 `build/semantic-router/` 中，不把模型权重提交到 Git。

7605 页的向量为 `7605 × 512` 个 float32，`vectors.npy` 为 15,575,168 字节。INT8 ONNX 权重为 23,903,394 字节；分词器约 439 KB。索引还包含路径、标题、领域和模型指纹等 JSON 元数据。这些都是系统成本，不能只用 12 个排序系数的大小描述全部成本。

构建采用文档标题、直接父标题、摘要和签名；非 API 文档补充前 1000 字符正文，并按模型分词器截断到 256 token。它不是对所有正文分块完整编码；长页后段细节可能无法召回。构建指纹包含完整源文档与配置，`--check` 会发现正文、元数据或锁文件变化。

## 查询

```sh
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 \
python scripts/semantic_router.py --index build/semantic-router \
  --query "如何让函数离开时自动关闭资源" \
  --query "HashMap.get" --top-k 5 --explain
```

参数协议与原生工具一致：重复 `--query` 一次处理多个问题；`--stdin` 每行输入一个问题，每行输出一个 JSON；`queries[].paths` 给出路径，`no_match` 表示空结果。支持 `--domain`，显式领域过滤同时作用于两路结果。路径相对于源码仓库，发布版 SQLite 的逻辑路径不等于已分发的 Markdown 文件。

默认 `--mode hybrid`：

- 精确 ID、路径或标题优先返回对应页。
- 原生 lane 显式使用 `--strategy hybrid`，提供代码符号与 API 所属对象的可靠候选。
- 中文问题的语义 lane 检索语言说明、工具和例子，减少数千个近似 API 成员摘要对概念问题的干扰。
- 语义候选逐个满足余弦相似度 `>= 0.65`，最多取 50 个。
- RRF 常数 20，原生权重 1，语义权重中文 0.5、其他 0.25；没有汉字时保留原生首项的额外 0.02 排序分。

这些是固定的开发集配置，不是学得的语义概率，也没有在新留出集上继续调参。`--mode dense` 为全库向量对照；`--mode dense --min-similarity 0` 可检查不带阈值的向量排序。默认阈值是为补充召回选择的保守门控，不能将它当成适用于所有任务的置信度。

原生可执行文件和索引路径可通过 `--native-binary`、`--native-index` 指定。`--native-strategy legacy` 仅用于不支持 `--strategy` 的原始 v1 可执行文件，不能与 v2 格式索引混用。

## 推理正确性和隐私边界

基于官方 BGE 方法使用 `[CLS]` 向量并做 L2 归一化，不使用 mean pooling；只在查询前加中文检索 instruction，文档不加 instruction。ONNX Session 固定为 `CPUExecutionProvider`，默认一个推理线程；构建可用 4 线程。性能评测应同时设置 `OPENBLAS_NUM_THREADS=1`、`OMP_NUM_THREADS=1`，避免宿主机的 BLAS 环境引入额外线程。

ONNX Runtime 1.32 的 `disable_telemetry_events()` 不能阻止已经发生的初始化事件。程序在任何 ONNX Runtime import 之前强制 `ORT_DISABLE_TELEMETRY=1`，并拒绝已经在未退出遥测的状态下初始化的运行时；同时保留 API 关闭。依据是安装包的 `onnxruntime/Privacy.md` 和 [官方 Privacy 文档](https://github.com/microsoft/onnxruntime/blob/main/docs/Privacy.md)。仅传本地模型路径不足以保证遥测关闭。

运行时核对模型和向量哈希，拒绝重复 ID、重复路径、越界路径、非有限向量及维度不匹配。模型相似度不是相关性概率；领域外问题仍可能共享词义并误命中。当前没有完整的知识库可回答性分类器。

## 开发集结果与限制

旧 66 条查询已经作为开发集用于方案选择，不再作为本轮新的盲测证据。当前开发快照上，混合方案 Hit@5 为 56/58；纯向量带 0.65 阈值为 22/58；纯向量去阈值为 30/58。后两项说明阈值会损失召回，近似 API 语义也会造成排序噪声。不能仅引用保守阈值下的低分来否定编码器，也不能把混合收益全部归因于神经模型。

纯向量去阈值会为全部领域外问题输出结果，向量最近邻并不自动具备拒答能力。应以本轮独立查询集和全部 CPU/RSS 测量决定是否值得部署这条可选路线。

协议与输入验证测试：

```sh
python -m unittest discover -s native/doc_router/semantic -p 'test_semantic_router.py' -v
```

## 来源和许可

- 原始模型：[BAAI/bge-small-zh-v1.5](https://huggingface.co/BAAI/bge-small-zh-v1.5)，模型卡标注 MIT。
- 转换版本：[Xenova/bge-small-zh-v1.5](https://huggingface.co/Xenova/bge-small-zh-v1.5)，固定提交 `75c43b069aac4d136ba6bc1122f995fedcfd2781`；其 README 明确标注原始 BAAI base model，未另列独立 license 字段。代码不重新分发转换权重。
- [ONNX Runtime](https://github.com/microsoft/onnxruntime)、[Hugging Face tokenizers](https://github.com/huggingface/tokenizers) 为可选运行时依赖，具体版本见 `requirements.txt`。

检索脚本为本仓库独立实现，没有复制 Jev 或其他检索项目的服务端权重或源码。
