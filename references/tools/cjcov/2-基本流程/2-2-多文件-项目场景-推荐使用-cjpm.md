<!-- cj-doc kind="guide-leaf" level="5" id="tools.cjcov.2-基本流程.2-2-多文件-项目场景-推荐使用-cjpm" parent="tools.cjcov.2-基本流程" -->
# 2.2 多文件/项目场景（推荐使用 cjpm）

[← 2. 基本流程](index.md)

```bash
cjpm build --coverage       # 编译带覆盖率
cjpm test --coverage        # 测试带覆盖率
cjcov -o output --html-details
```

Windows cjnative 1.0.5 的稳健做法是把需要报告的 `.gcda`/`.gcno` 复制到项目根附近的短目录，再把该目录传给 `--root`。`cjpm test --coverage` 生成的 `$test` 图可能只记录无法解析的裸源码名；长项目路径还会使 llvm-cov 中间文件超过 Windows MAX_PATH，导致 cjcov 崩溃或后续 `cjpm clean` 失败。若只统计生产源码，可排除文件名含 `$test` 的图并平铺到 `.cov/`：

```powershell
$stage = Join-Path $PWD '.cov'
New-Item -ItemType Directory -Force $stage | Out-Null
Get-ChildItem cov_output -Recurse -File |
    Where-Object { @('.gcda', '.gcno') -contains $_.Extension -and $_.Name -notlike '*$test*' } |
    Copy-Item -Destination $stage
cjcov --root=$stage -o reports/coverage --html-details -x -j
```

平铺前应检查是否有同名图；报告完成后用明确路径清理 `.cov/` 和 `cov_output/`，不要用项目根递归通配删除。

---
