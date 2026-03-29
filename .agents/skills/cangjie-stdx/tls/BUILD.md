# TLS 项目配置构建指导

关于 TLS 接口用法，请参阅 [README.md](./README.md)。

---

## 1. OpenSSL 3 安装

### 1.1 Linux

```bash
# Ubuntu 22.04+ / Debian
sudo apt install libssl-dev

# CentOS / RHEL
sudo dnf install openssl-devel
```

确保系统存在 `libssl.so`、`libssl.so.3`、`libcrypto.so`、`libcrypto.so.3`。

自定义安装路径时：

```bash
export LD_LIBRARY_PATH=/path/to/openssl/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=/path/to/openssl/lib:$LIBRARY_PATH
```

### 1.2 macOS

```bash
brew install openssl@3
```

确保存在 `libssl.dylib`、`libssl.3.dylib`、`libcrypto.dylib`、`libcrypto.3.dylib`。

### 1.3 Windows

安装 OpenSSL 3.x.x（x64），确保存在 `libssl-3-x64.dll`、`libcrypto-3-x64.dll`，并将目录添加到 `PATH`。

### 1.4 验证

```bash
openssl version
# 应输出 OpenSSL 3.x.x
```

---

## 2. cjpm.toml 配置

### 2.1 动态库配置（推荐开发阶段）

```toml
[package]
  name = "my-tls-app"
  version = "1.0.0"
  output-type = "executable"

[dependencies]

[target.x86_64-unknown-linux-gnu]
  [target.x86_64-unknown-linux-gnu.bin-dependencies]
    path-option = ["/path/to/stdx/dynamic/stdx"]
```

其他平台：
- Linux aarch64：`target.aarch64-unknown-linux-gnu`
- macOS aarch64：`target.aarch64-apple-darwin`
- macOS x86_64：`target.x86_64-apple-darwin`
- Windows x86_64：`target.x86_64-w64-mingw32`

### 2.2 静态库配置（推荐生产部署）

使用 crypto 和 net 包的静态库时，需要额外 `compile-option`：

| 平台 | compile-option | 原因 |
|------|----------------|------|
| Linux | `-ldl` | OpenSSL 静态库依赖 `libdl` |
| Windows | `-lcrypt32` | OpenSSL 依赖 Windows 证书存储 API |
| macOS | 无需额外配置 | — |

```toml
[package]
  name = "my-tls-app"
  version = "1.0.0"
  output-type = "executable"
  compile-option = "-ldl"

[dependencies]

[target.x86_64-unknown-linux-gnu]
  [target.x86_64-unknown-linux-gnu.bin-dependencies]
    path-option = ["/path/to/stdx/static/stdx"]
```

---

## 3. 构建与运行

```bash
# 1. 初始化项目
cjpm init --name my-tls-app

# 2. 编辑 cjpm.toml，添加 bin-dependencies 配置

# 3. 构建
cjpm build

# 4. 运行（自动配置动态库路径）
cjpm run
```

独立部署运行（动态库）需设置：

| 操作系统 | 环境变量 | 示例 |
|----------|----------|------|
| Linux | `LD_LIBRARY_PATH` | `export LD_LIBRARY_PATH=/path/to/stdx/dynamic/stdx:$LD_LIBRARY_PATH` |
| macOS | `DYLD_LIBRARY_PATH` | `export DYLD_LIBRARY_PATH=/path/to/stdx/dynamic/stdx:$DYLD_LIBRARY_PATH` |
| Windows | `PATH` | 将 stdx 动态库目录和 OpenSSL DLL 目录添加到 `PATH` |

---

## 4. 常见问题

| 问题 | 原因 | 解决 |
|------|------|------|
| `TlsException: Can not load openssl library` | 未安装 OpenSSL 3 或版本低 | 安装 OpenSSL 3，确认 `openssl version` 为 3.x.x |
| 编译找不到 `stdx.net.tls` 包 | `cjpm.toml` 路径不正确 | 确认路径指向 `dynamic/stdx` 或 `static/stdx` 子目录 |
| 静态库链接报 undefined reference | 缺少平台链接选项 | Linux 添加 `-ldl`，Windows 添加 `-lcrypt32` |
| 运行时找不到动态库 | 未设置动态库搜索路径 | 设置 `LD_LIBRARY_PATH` 或改用静态库 |
