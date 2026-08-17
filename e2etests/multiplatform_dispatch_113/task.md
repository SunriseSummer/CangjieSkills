# 1.1.3 多平台源码集与 common/specific 分派

在仓颉 `1.1.3 (cjnative)` 中创建可执行包 `multiplatform_dispatch_113`，使用实验性 feature/source-set 构建。将随题提供的 `multiplatform_dispatch_113_test.cj` 原样复制到 `windows/` 源码集，测试不可修改。

项目必须包含：

- 公共非产品源码集 `common/`，文件头为 `@NonProduct features {}`；
- Windows 产品源码集 `windows/`，文件头为 `features {user.multiplatform_dispatch_113.windows}`；
- `[profile] experimental = true`、对应的 `[[feature]]` 与两个 `[[source-set]]`；Windows 源码集显式 `product = true`。

公共侧声明并实现以下 API：

```cangjie
public common func platformName(): String
public common func commonBanner(name: String): String
public common class PlatformFormatter {
    public common init()
    public common func format(values: Array<Int64>): String
}
```

要求：

- `platformName` 只在 Windows specific 侧实现并返回 `"windows"`。
- `commonBanner` 只在 common 侧实现，返回 `"cangjie:<name>"`；不得在 specific 侧重复声明。
- `PlatformFormatter` 在两侧成对声明构造函数和 `format`；Windows 实现把数组格式化为 `win[1,2,3]`，空数组为 `win[]`。
- Windows 产品源码集提供 `main`，输出 `cangjie:windows|win[1,2,3]`。
- 不得把 common/specific 合并到同一文件，不得用 `@When`、环境变量或普通条件分支模拟平台分派。

最终依次执行：

```text
cjpm clean
cjpm run --no-feature-deduce --enable-features=user.multiplatform_dispatch_113.windows
cjpm test --no-feature-deduce --enable-features=user.multiplatform_dispatch_113.windows
```

程序输出精确匹配，全部测试通过，生产源码零 warning。

