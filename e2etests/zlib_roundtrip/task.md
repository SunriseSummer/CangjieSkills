# zlib 文件往返校验器

创建仓颉 1.0.5 可执行项目 `zlib_roundtrip`。程序读取第一个命令行参数指定的二进制文件，用 `stdx.compress.zlib` 压缩到内存、再解压，比较结果并输出 `original=<字节数>;compressed=<字节数>;roundtrip=true`；不匹配或处理失败时返回非零状态。

要求：

- 先建立 `cjpm.toml`，然后通过当前 Skill 的 `setup_stdx.py` 配置依赖；不得手写或猜测 stdx 二进制路径。
- 压缩/解压逻辑与 CLI 分离，正确关闭或完成流。
- 将已给定且不可修改的 `zlib_roundtrip_test.cj` 逐字节复制到项目 `src/`；它覆盖空数据、短文本、重复数据和全部 0..255 字节，可按需另行补充测试。
- 执行 `cjpm test`，并对临时二进制文件实际执行 `cjpm run --run-args '<file>'`。
