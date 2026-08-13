<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.struct.transportconfig.prop-writebuffersize" parent="stdx.net.http.struct.transportconfig" -->
# TransportConfig.writeBufferSize

[← TransportConfig](index.md)

## 签名

```cangjie role=signature
public mut prop writeBufferSize: ?Int64
```

设定和读取传输层连接的写缓冲区大小，默认值为 None ，若设置的值小于 0，将在服务器进行服务建立连接后抛出 IllegalArgumentException。

## 契约

> **说明：**
>
> 使用默认值时，实际的缓冲区大小将由操作系统决定。

类型：?Int64
