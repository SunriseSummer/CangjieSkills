<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.class.x509name.init" parent="stdx.crypto.x509.class.x509name" -->
# X509Name.init

[← X509Name](index.md)

## 签名

```cangjie role=signature
public init(
        countryName!: ?String = None,
        provinceName!: ?String = None,
        localityName!: ?String = None,
        organizationName!: ?String = None,
        organizationalUnitName!: ?String = None,
        commonName!: ?String = None,
        email!: ?String = None
    )
```

构造 X509Name 对象。

## 契约

参数：

- countryName!: ?String - 国家或地区名称，默认值为 None。
- provinceName!: ?String - 州或省名称，默认值为 None。
- localityName!: ?String - 城市名称，默认值为 None。
- organizationName!: ?String - 组织名称，默认值为 None。
- organizationalUnitName!: ?String - 组织单位名称，默认值为 None。
- commonName!: ?String - 通用名称，默认值为 None。
- email!: ?String - email 地址，默认值为 None。

异常：

- X509Exception - 设置证书实体可辨识名称时失败，比如内存分配异常等内部错误，则抛出异常。
