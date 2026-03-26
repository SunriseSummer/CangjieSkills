# 仓颉通用程序开发 Skills

这套 Skills 可支撑 AI 开发工具从零创建开发仓颉项目，包括项目配置、开发、构建、运行、单元测试等，包括 stdx、macro、CFFI 等场景的自动处理。

## 快速安装

以使用 OpenCode 为例，在仓颉项目目录下执行如下命令：

```shell
npx skills add https://github.com/SunriseSummer/CangjieSkills.git -a opencode -y
```

> 根据您使用的 AI 开发工具，`-a` 选项后可以接 `claude-code`，`cursor`，`antigravity`，`trae` 等，其他详见 https://www.npmjs.com/package/skills

如果没有 node 环境，您也可以手动下载本仓库，把 `.agents/skills` 部署到所用 AI 工具的 Skills 搜索路径中。

**注意事项**

- 请在全局环境配置好[仓颉通用版本工具链](https://cangjie-lang.cn/download/)，全局可引用 cjpm 等工具。
- 如果项目需要使用 stdx，鉴于一些 AI 开发工具未启用网络下载功能，因此建议您手动下载所需版本的 stdx 并解压到项目根目录，AI 会根据 Skills 指导自动配置。

## 仓颉定制版 OpenCode

[Release](https://gitcode.com/Cangjie-SIG/CangjieSkills/releases) 板块提供了一个仓颉定制版 OpenCode（Beta），接入仓颉 LSP 和 cjfmt，并集成 cangjie-tree-sitter.wasm 支持仓颉语法高亮。使用前请确保环境中可正常引用仓颉工具链，OpenCode 会适时引用 LSP 和 cjfmt。

- OpenCode for Cangjie：https://github.com/SunriseSummer/opencode
- TreeSitter for Cangjie：https://github.com/SunriseSummer/CangjieTreeSitter

![2026-03-09 00 35 41.png](https://raw.gitcode.com/user-images/assets/9193544/088b512b-e8b2-4d5c-a2dd-3d53b8e4a0b9/2026-03-09_00_35_41.png '2026-03-09 00 35 41.png')



## 使用案例

1、使用 OpenCode/GLM5 开发的 [AI 聊天工具](https://gitcode.com/Cangjie/Cangjie-Examples/tree/1.0.0/AIChatPro)，支持多模型切换、JSON 配置文件、流式请求、控流打字机效果、对话上下文等功能。

![完成开发.png](https://raw.gitcode.com/user-images/assets/9193544/d5824ec8-8fa6-4841-8a4d-10d282324109/完成开发.png '完成开发.png')

![运行效果.png](https://raw.gitcode.com/user-images/assets/9193544/65bf2447-a413-4046-99cd-f6cefc947dd4/运行效果.png '运行效果.png')

2、使用 OpenCode/GLM5 + Claude Opus 4.6 开发的[仓颉语言子集解释器](https://gitcode.com/Cangjie/Cangjie-Examples/tree/1.0.0/CangjieLua)，生成 LuaVM 字节码并执行。

![glm5-初始过程.png](https://raw.gitcode.com/user-images/assets/9193544/1f6e4e6d-7b38-4893-8abe-c78ddd0574e2/glm5-初始过程.png 'glm5-初始过程.png')

![image.png](https://raw.gitcode.com/user-images/assets/9193544/36fb1954-6d3c-4eb7-b54f-acf6d5f670e0/image.png 'image.png')

![798bcbe3952cb5113338efd234771581.png](https://raw.gitcode.com/user-images/assets/9193544/6b2ad68a-a2e6-448b-b581-14a79f18763e/798bcbe3952cb5113338efd234771581.png '798bcbe3952cb5113338efd234771581.png')

> 集成更多仓颉语言特性的解释器项目（仓颉奔月计划）：https://github.com/SunriseSummer/MoonCangjie
