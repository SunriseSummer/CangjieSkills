# 仓颉静态检查工具 cjlint Skill

## 1. 概述

`cjlint`（Cangjie Lint）是基于仓颉语言编程规范的静态检查工具，帮助识别不符合规范的代码问题和安全漏洞。

---

## 2. 基本用法

```bash
cjlint -f src/                              # 检查 src 目录
cjlint -f "dir1 dir2" -c . -m .             # 检查多个目录
cjlint -f src/ -r csv -o ./report           # 输出 CSV 报告
cjlint -f src/ -e "test/ generated/"        # 排除目录
```

> **注意**：`-f` 后指定的是 `.cj` 文件所在的 `src` 目录，不是单个文件。

---

## 3. 命令选项

| 选项 | 说明 |
|------|------|
| `-h` | 显示帮助信息 |
| `-v` | 显示版本号 |
| `-f <dir>` | 指定检查目录（多个目录用空格分隔，双引号包裹） |
| `-e <v1:v2:...>` | 排除文件/目录（支持正则） |
| `-o <path>` | 输出报告路径 |
| `-r [csv\|json]` | 报告格式（默认 json，须配合 `-o`） |
| `-c <path>` | config 目录路径 |
| `-m <path>` | modules 目录路径 |
| `--import-path <dir>` | 添加 `.cjo` 搜索路径 |

---

## 4. 告警屏蔽

### 4.1 规则级屏蔽
编辑 `config/cjlint_rule_list.json`，仅保留需要检查的规则：
```json
{
    "RuleList": ["G.FMT.01", "G.NAM.01", "G.VAR.01"]
}
```

编辑 `config/exclude_lists.json` 屏蔽特定告警：
```json
{
    "G.OTH.01": [
        {"path": "xxx/example.cj", "line": "42"}
    ]
}
```

### 4.2 源代码注释屏蔽

**单行屏蔽**：
```cangjie
func foo(a: Int64, b: Int64, c: Int64, d: Int64) { // cjlint-ignore !G.FUN.02 描述
    return a + b + c
}
```

**多行屏蔽**：
```cangjie
// cjlint-ignore -start !G.FUN.02 描述
func foo(a: Int64, b: Int64, c: Int64, d: Int64) {
    return a + b + c
}
// cjlint-ignore -end 描述
```

> `cjlint-ignore`、选项（`-start`/`-end`）和规则名须在同一行。

### 4.3 文件级屏蔽
```bash
cjlint -f src/ -e "dir1/ dir2/a.cj test*.cj"      # 命令行排除
```
或使用 `.cfg` 配置文件批量导入，默认配置文件为 `src/cjlint_file_exclude.cfg`。

---

## 5. 常用规则分类

### 5.1 命名规范（G.NAM）
| 规则 | 说明 |
|------|------|
| G.NAM.01 | 包名全小写，允许数字和下划线 |
| G.NAM.02 | 源文件名全小写加下划线 |
| G.NAM.03 | 类/接口/struct/枚举/类型别名采用大驼峰 |
| G.NAM.04 | 函数名小驼峰 |
| G.NAM.05 | `let` 全局变量和 `static let` 全大写 |

### 5.2 格式规范（G.FMT）
| 规则 | 说明 |
|------|------|
| G.FMT.01 | 源文件编码格式（含注释）必须是 UTF-8 |
| G.FMT.15 | 禁止省略浮点数小数点前的 0 |

### 5.3 声明与函数（G.DCL/G.FUN）
| 规则 | 说明 |
|------|------|
| G.DCL.01 | 避免变量遮盖（shadow） |
| G.DCL.02 | public 变量/函数显式声明类型 |
| G.FUN.01 | 函数功能单一 |
| G.FUN.02 | 禁止未使用的参数 |
| G.FUN.03 | 避免在无关函数间重用名字构成重载 |

### 5.4 类/接口/枚举/变量（G.CLS/G.ITF/G.ENU/G.VAR）
| 规则 | 说明 |
|------|------|
| G.CLS.01 | override 父类函数时不要增加可访问性 |
| G.ITF.01 | 需要原地修改对象的抽象函数尽量使用 `mut` 修饰 |
| G.ITF.02 | 尽量在类型定义处实现接口，而非通过扩展 |
| G.ITF.03 | 类型定义时避免同时声明实现父接口和子接口 |
| G.ITF.04 | 尽量通过泛型约束使用接口，而不是直接将接口作为类型 |
| G.ENU.01 | 避免枚举构造成员与顶层元素同名 |
| G.ENU.02 | 避免不同 enum 的 constructor 之间不必要的重载 |
| G.VAR.01 | 优先使用不可变变量 |
| G.VAR.02 | 保持变量作用域尽可能小 |

### 5.5 表达式与类型（G.EXP/G.TYP/G.OPR）
| 规则 | 说明 |
|------|------|
| G.EXP.01 | match 表达式同一层避免不同类别 pattern 混用 |
| G.EXP.02 | 不要期望浮点运算得到精确的值 |
| G.EXP.03 | `&&`/`||`/`?`/`??` 右侧操作数不要包含副作用 |
| G.EXP.04 | 避免副作用依赖于操作符的求值顺序 |
| G.EXP.05 | 用括号明确表达式操作顺序，避免过分依赖默认优先级 |
| G.EXP.06 | Bool 比较应避免多余的 `==`/`!=` |
| G.EXP.07 | 比较两个表达式时，左侧倾向于变化，右侧倾向于不变 |
| G.TYP.03 | 判断 NaN 须使用 `isNaN()` 方法 |
| G.OPR.01 | 避免违反使用习惯的操作符重载 |
| G.OPR.02 | 避免在枚举类型内定义 `()` 操作符重载函数 |

### 5.6 错误处理与包（G.ERR/G.PKG）
| 规则 | 说明 |
|------|------|
| G.ERR.01 | 恰当使用异常或错误处理机制 |
| G.ERR.02 | 防止通过异常抛出的内容泄露敏感信息 |
| G.ERR.03 | 避免对 Option 类型使用 `getOrThrow` |
| G.ERR.04 | 不要在 `finally` 块中使用 `return`/`break`/`continue` 或抛异常 |
| G.PKG.01 | 避免在 `import` 声明中使用通配符 `*` |

### 5.7 安全相关（G.CHK/G.CON/G.SEC/G.FIO/G.SER/G.OTH/P/FFI）
| 规则 | 说明 |
|------|------|
| G.CHK.01 | 跨信任边界数据须校验 |
| G.CHK.02 | 禁止直接使用外部数据记录日志 |
| G.CHK.03 | 使用外部数据构造文件路径前须校验，校验前须规范化处理 |
| G.CHK.04 | 禁止直接使用不可信数据构造正则表达式 |
| G.CON.01 | 禁止暴露内部锁对象 |
| G.CON.02 | 异常可能出现时保证释放已持有的锁 |
| G.CON.03 | 禁止使用非线程安全的函数覆写线程安全的函数 |
| G.SEC.01 | 安全检查方法禁止声明为 `open` |
| G.FIO.01 | 临时文件使用完毕须及时删除 |
| G.SER.01 | 禁止序列化未加密的敏感数据 |
| G.SER.02 | 防止反序列化绕过构造方法中的安全操作 |
| G.SER.03 | 保证序列化和反序列化的变量类型一致 |
| G.OTH.01 | 禁止日志中保存敏感数据 |
| G.OTH.02 | 禁止硬编码敏感信息 |
| G.OTH.03 | 禁止代码中包含公网地址 |
| G.OTH.04 | 不要使用 String 存储敏感数据，用完立即清零 |
| P.01 | 使用相同顺序请求锁，避免死锁 |
| P.02 | 避免数据竞争（data race） |
| P.03 | 对外部对象进行安全检查时需防御性拷贝 |
| FFI.C.7 | 强制指针类型转换时避免截断错误 |

### 5.8 默认不启用规则
- G.NAM.06（变量名小驼峰）、G.VAR.03（避免全局变量）、G.FMT.13（文件头版权注释）
- 需手动添加到 `cjlint_rule_list.json` 启用

---

## 6. 语法禁用检查

启用 G.SYN.01 后，在 `structural_rule_G_SYN_01.json` 中配置禁用的语法关键字：
```json
{
    "SyntaxKeyword": ["Import", "Spawn", "Foreign"]
}
```

支持的关键字：`Import`、`Let`、`Spawn`、`Synchronized`、`Main`、`MacroQuote`、`Foreign`、`While`、`Extend`、`Type`、`Operator`、`GlobalVariable`、`Enum`、`Class`、`Interface`、`Struct`、`Generic`、`When`、`Match`、`TryCatch`、`HigherOrderFunc`、`PrimitiveType`、`ContainerType`。
