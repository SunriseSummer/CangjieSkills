<!-- cj-doc kind="api-member" level="6" id="std.fs.struct.path.prop-filenamewithoutextension" parent="std.fs.struct.path" -->
# Path.fileNameWithoutExtension

[← Path](index.md)

## 签名

```cangjie role=signature
public prop fileNameWithoutExtension: String
```

获得 Path 的文件名（不含扩展名）部分。

## 契约

文件名 fileName 根据最后一个 r'.' 被划分为不带扩展名的文件名 fileNameWithoutExtension 和扩展名 extensionName 两部分。无文件名（不含扩展名）时返回空字符串。

- 对于路径 "./NewFile.txt"，此属性返回 `"NewFile"`。
- 对于路径 "./.gitignore"，此属性返回 `""`。
- 对于路径 "./noextension"，此属性返回 `"noextension"`。
- 对于路径 "./a.b.c"，此属性返回 `"a.b"`。
- 对于路径 "./NewFile/"，此属性返回 `"NewFile"`。

类型：String

异常：

- IllegalArgumentException - 当路径为空或包含字符串结束符则抛出异常。
