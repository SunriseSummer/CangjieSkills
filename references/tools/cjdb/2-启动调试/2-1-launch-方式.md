<!-- cj-doc kind="guide-leaf" level="5" id="tools.cjdb.2-启动调试.2-1-launch-方式" parent="tools.cjdb.2-启动调试" -->
# 2.1 launch 方式

[← 2. 启动调试](index.md)

命令：`cjdb ./test`。

```bash
# 方式一：启动时加载程序
cjdb ./test

# 方式二：先启动再加载
cjdb
(cjdb) file test
```
