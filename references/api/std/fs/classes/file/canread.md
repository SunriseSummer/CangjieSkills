<!-- cj-doc kind="api-member" level="6" id="std.fs.class.file.canread" parent="std.fs.class.file" -->
# File.canRead

[← File](index.md)

## 签名

```cangjie role=signature
public func canRead(): Bool
```

判断当前 File 对象是否可读。

## 契约

该函数返回值由创建文件对象的 openMode 所决定，文件对象关闭后返回 false。

返回值：

- Bool - 返回 true 表示可读，返回 false 表示不可读或文件对象已关闭。
