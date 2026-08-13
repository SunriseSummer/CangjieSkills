# JSON 配置归一化器

创建仓颉 1.0.5 可执行项目 `json_config`。程序读取第一个命令行参数指定的 UTF-8 JSON 文件，使用 `stdx.encoding.json` 解析如下字段：`name: String`、`workers: Int64`、`enabled: Bool`，并输出一行 `name=<值>;workers=<值>;enabled=<值>`。字段缺失、类型错误或 JSON 非法时输出清晰错误并返回非零状态。

要求：

- 先建立 `cjpm.toml`，然后通过当前 Skill 的 `setup_stdx.py` 配置依赖；不得手写或猜测 stdx 二进制路径。
- 把配置解析封装到独立源文件，`main.cj` 只负责 I/O 与退出状态。
- 将已给定且不可修改的 `json_config_test.cj` 逐字节复制到项目 `src/`，可在其基础上补充正常、字段缺失、类型错误和非法 JSON 测试。
- 执行 `cjpm test`，并用临时输入文件实际执行 `cjpm run --run-args '<file>'`。
