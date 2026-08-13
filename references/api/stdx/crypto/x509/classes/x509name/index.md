<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.x509.class.x509name" parent="stdx.crypto.x509" -->
# X509Name

[← stdx.crypto.x509](../../index.md)

`X509Name <: ToString`

证书实体可辨识名称（Distinguished Name）是数字证书中的一个重要组成部分，作用是确保证书的持有者身份的真实性和可信度，同时也是数字证书验证的重要依据之一。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`commonName: ?String`](prop-commonname.md) | 返回证书实体的通用名称。 |
| [`countryName: ?String`](prop-countryname.md) | 返回证书实体的国家或地区名称。 |
| [`email: ?String`](prop-email.md) | 返回证书实体的 email 地址。 |
| [`localityName: ?String`](prop-localityname.md) | 返回证书实体的城市名称。 |
| [`organizationName: ?String`](prop-organizationname.md) | 返回证书实体的组织名称。 |
| [`organizationalUnitName: ?String`](prop-organizationalunitname.md) | 返回证书实体的组织单位名称。 |
| [`provinceName: ?String`](prop-provincename.md) | 返回证书实体的州或省名称。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init( countryName!: ?String = None, provinceName!: ?String = None, localityName!: ?String = None, organizationName!: ?String = None, organizationalUnitName!: ?String = None, commonName!: ?String = None, email!: ?String = None )`](init.md) | 构造 X509Name 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`override toString(): String`](tostring.md) | 生成证书实体名称字符串。 |
