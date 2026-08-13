<!-- cj-doc kind="guide-leaf" level="4" id="tools.cangjie-language-server.2-windows-启动示例" parent="tools.cangjie-language-server" -->
# 2. Windows 启动示例

[← Cangjie Language Server](index.md)

```powershell
LSPServer.exe --enable-log=true --log-path=D:/CangjieLSPLog -V --disableAutoImport
```

正常开发应让 IDE 客户端管理服务器进程与标准输入输出连接；手动启动主要用于客户端集成和日志诊断。
