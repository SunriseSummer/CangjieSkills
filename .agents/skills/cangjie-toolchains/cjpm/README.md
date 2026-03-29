# 仓颉项目管理工具 cjpm

## 1. 基本用法

```bash
cjpm init                          # 创建新模块（默认 executable 类型）
cjpm init --workspace              # 创建工作空间
cjpm init --type=static            # 创建静态库模块
cjpm build                         # 编译当前模块
cjpm run                           # 编译并运行
cjpm test                          # 编译并运行单元测试
cjpm bench                         # 编译并运行基准测试
cjpm clean                         # 清理构建产物（target 目录）
cjpm install                       # 安装仓颉可执行文件
cjpm tree                          # 显示依赖树
```

---

## 2. 项目结构与 cjpm.toml

### 2.1 目录结构

```
myapp/
├── cjpm.toml              # 项目配置文件
├── src/
│   ├── main.cj            # 主入口（executable 类型）
│   ├── lib_test.cj        # 测试文件（_test.cj 后缀）
│   └── utils/
│       └── helper.cj      # 子包
└── target/                # 构建产物目录（自动生成）
```

### 2.2 基本 cjpm.toml（单模块）

```toml
[package]
  cjc-version = "1.0.5"
  name = "myapp"
  version = "1.0.0"
  output-type = "executable"

[dependencies]
  mylib = { path = "./libs/mylib" }
```

**[package] 关键字段：**

| 字段 | 说明 |
|------|------|
| `cjc-version` | 最低 cjc 版本要求（必填） |
| `name` | 模块名 / 根包名（必填） |
| `version` | 模块版本号（必填） |
| `output-type` | `"executable"` / `"static"` / `"dynamic"`（必填） |
| `compile-option` | 额外编译选项 |
| `link-option` | 透传链接器选项 |
| `src-dir` | 源码目录路径 |
| `target-dir` | 输出目录路径 |

### 2.3 工作空间 cjpm.toml

```toml
[workspace]
  members = ["app", "libs/core", "libs/util"]
  compile-option = ""
  link-option = ""
```

> **注意**：`[package]` 与 `[workspace]` 互斥，不可同时使用。

**[workspace] 关键字段：**

| 字段 | 说明 |
|------|------|
| `members` | 成员模块路径列表（必填） |
| `build-members` | 参与编译的成员子集 |
| `test-members` | 参与测试的成员子集（须为 build-members 子集） |
| `compile-option` | 全局编译选项 |
| `link-option` | 全局链接选项 |
| `target-dir` | 全局输出目录 |

### 2.4 示例主程序

```cangjie
// main.cj —— 可执行项目入口
package myapp

import std.collection.*

main(): Int64 {
    let list = ArrayList<Int64>([1, 2, 3])
    for (v in list) {
        println(v)
    }
    return 0
}
```

---

## 3. 常用命令选项表

### 3.1 build 选项

| 选项 | 说明 |
|------|------|
| `-i, --incremental` | 增量编译 |
| `-j, --jobs <N>` | 并行编译线程数（上限 2×CPU 核数） |
| `-g` | 生成调试版本 |
| `-V, --verbose` | 显示编译详情 |
| `--coverage` | 启用覆盖率插桩 |
| `--cfg <value>` | 传递条件编译变量 |
| `-m, --member <value>` | 指定工作空间成员 |
| `--target <value>` | 交叉编译目标平台 |
| `--target-dir <value>` | 指定输出目录 |
| `-o, --output <value>` | 指定可执行文件名（默认 `main`） |
| `-l, --lint` | 启用 cjlint 代码检查 |
| `--mock` | 启用 mock 功能 |
| `--skip-script` | 跳过 build.cj 脚本执行 |

### 3.2 run 选项

| 选项 | 说明 |
|------|------|
| `--name <value>` | 指定运行的二进制名（默认 `main`） |
| `--build-args <value>` | 传递给 build 的参数 |
| `--run-args <value>` | 传递给可执行文件的参数 |
| `--skip-build` | 跳过编译，直接运行 |
| `-g` | 运行调试版本 |
| `--skip-script` | 跳过构建脚本 |

```bash
# 传递编译与运行参数
cjpm run --build-args="-s -j16" --run-args="a b c"
```

### 3.3 test 选项

| 选项 | 说明 |
|------|------|
| `--filter <value>` | 过滤测试用例（通配符匹配，如 `*`/`*.*`/`*.*Test`） |
| `--timeout-each <value>` | 单测超时，格式 `%d[millis\|s\|m\|h]` |
| `--parallel <value>` | 并行策略：`true`/`false`/`nCores`/`<N>` |
| `--random-seed <value>` | 随机种子（正整数） |
| `--no-color` | 禁用彩色输出 |
| `--report-path <value>` | 测试报告输出路径 |
| `--report-format <value>` | 报告格式（`xml`） |
| `--coverage` | 启用覆盖率统计 |

```bash
cjpm test                              # 运行全部测试
cjpm test src/utils                    # 测试指定包
cjpm test --filter "testAdd"           # 过滤指定测试用例
cjpm test --timeout-each 30s           # 设置单测超时 30 秒
cjpm test --parallel 4                 # 4 线程并行测试
```

---

## 4. 依赖管理

### 4.1 源码依赖

```toml
[dependencies]
  # 本地路径依赖
  core = { path = "./libs/core" }
  # Git 依赖（分支）
  logger = { git = "https://example.com/logger.git", branch = "main" }
  # Git 依赖（标签）
  utils = { git = "https://example.com/utils.git", tag = "v1.0.0" }
```

### 4.2 测试依赖

```toml
[test-dependencies]
  mock_lib = { path = "./test_libs/mock" }
```

### 4.3 依赖替换

```toml
[replace]
  # 将远程依赖替换为本地路径（调试时常用）
  logger = { path = "./local_logger" }
```

### 4.4 构建脚本依赖

```toml
[script-dependencies]
  codegen = { path = "./tools/codegen" }
```

---

## 5. 测试与基准

### 5.1 编写测试

测试文件以 `_test.cj` 结尾，放在 `src/` 目录下：

```cangjie
// src/math_test.cj
package myapp

import std.unittest.*
import std.unittest.testmacro.*

@Test
func testAdd(): Unit {
    @Expect(1 + 1, 2)
}

@Test
func testMultiply(): Unit {
    @Expect(3 * 4, 12)
}
```

```bash
cjpm test                              # 运行全部测试
cjpm test --coverage                   # 测试并生成覆盖率
```

### 5.2 基准测试

```bash
cjpm bench                             # 运行基准测试
cjpm bench --filter "benchSort"        # 过滤指定基准
```

---

## 6. 高级配置

### 6.1 Profile 配置

```toml
[profile.build]
  compile-option = "-O2"
  lto = "full"                         # "thin" 或 "full"（仅 Linux）

[profile.test]
  compile-option = "-g"
  mock = "on"                          # "on"（默认）/ "off" / "runtime-error"

[profile.test.env]
  MY_ENV = { value = "abc" }
  cjHeapSize = { value = "32GB", splice-type = "replace" }
  PATH = { value = "/usr/local/bin", splice-type = "prepend" }

[profile.bench]
  no-color = true
  report-format = "csv"                # "csv" 或 "csv-raw"
  baseline-path = "bench_baseline"     # 对比基线报告路径
```

**环境变量 splice-type：**

| 类型 | 说明 |
|------|------|
| `absent` | 仅在变量不存在时生效（默认） |
| `replace` | 替换已有变量值 |
| `prepend` | 插入到已有值之前 |
| `append` | 追加到已有值之后 |

### 6.2 C 语言 FFI 集成

```toml
[ffi.c]
  myc.path = "./c_libs"               # C 库目录路径
```

### 6.3 交叉编译（target）

```toml
[target.x86_64-unknown-linux-gnu]
  compile-option = "-O2"
  link-option = "-L/usr/lib"

[target.x86_64-unknown-linux-gnu.dependencies]
  platform_lib = { path = "./libs/linux" }

[target.x86_64-w64-mingw32.bin-dependencies]
  path-option = ["./win_libs"]
```

```bash
cjpm build --target x86_64-w64-mingw32    # 交叉编译到 Windows
```

### 6.4 构建脚本（build.cj）

项目根目录放置 `build.cj` 可在编译前后执行自定义逻辑。使用 `--skip-script` 跳过执行。

### 6.5 包级别配置

```toml
[package]
  name = "myapp"
  # 为指定子包设置独立编译选项
  package-configuration = { "myapp.utils" = { compile-option = "-O2" } }
```

---

## 7. 关键规则速查

| 规则 | 说明 |
|------|------|
| 配置互斥 | `[package]` 与 `[workspace]` 不可同时存在 |
| 测试文件 | 文件名以 `_test.cj` 结尾，使用 `@Test` 宏标注 |
| 测试导入 | 必须导入 `std.unittest.*` 和 `std.unittest.testmacro.*` |
| 默认输出 | 可执行文件默认名为 `main`，产物在 `target/release/bin/` |
| 增量编译 | 使用 `-i` 启用，避免全量重编译 |
| 依赖锁定 | `cjpm.lock` 自动生成，`cjpm update` 更新 |
| 工作空间构建 | `-m <member>` 指定单个成员编译 |
| 覆盖率 | `--coverage` 须配合 `cjcov` 工具生成报告 |
| 环境变量 | Profile 中配置，仅顶层模块的设置生效 |
| 优先级 | 命令行选项 > 配置文件选项 |
