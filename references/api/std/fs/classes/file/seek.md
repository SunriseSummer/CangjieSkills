<!-- cj-doc kind="api-member" level="6" id="std.fs.class.file.seek" parent="std.fs.class.file" -->
# File.seek

[← File](index.md)

## 签名

```cangjie role=signature
public func seek(sp: SeekPosition): Int64
```

将光标跳转到指定位置。

## 契约

指定的位置不能位于文件头部之前，指定位置可以超过文件末尾，但指定位置到文件头部的最大偏移量不能超过当前文件系统允许的最大值，这个最大值接近当前文件系统的所允许的最大文件大小，一般为最大文件大小减去 4096 个字节。

参数：

- sp: SeekPosition - 指定光标跳转后的位置。

返回值：

- Int64 - 返回文件头部到跳转后位置的偏移量（以字节为单位）。

异常：

- FSException - 指定位置不满足以上情况时或文件不能 seek 时均会抛出异常。
