<!-- cj-doc kind="api-type" level="5" id="std.database.sql.class.sqloption" parent="std.database.sql" -->
# SqlOption

[← std.database.sql](../../index.md)

`SqlOption`

预定义的 sql 选项名称和值。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`ConnectionTimeout: String = "connection_timeout"`](field-connectiontimeout.md) | 获取 connect 操作的超时时间，单位 ms。 |
| [`Database: String = "database"`](field-database.md) | 获取数据库名称。 |
| [`Driver: String = "driver"`](field-driver.md) | 获取数据库驱动名称，比如 postgres，opengauss。 |
| [`Encoding: String = "encoding"`](field-encoding.md) | 获取数据库字符集编码类型。 |
| [`FetchRows: String = "fetch_rows"`](field-fetchrows.md) | 获取每次获取额外数据时从数据库中提取的行数。 |
| [`Host: String = "host"`](field-host.md) | 获取数据库服务器主机名或者 IP 地址。 |
| [`Password: String = "password"`](field-password.md) | 获取连接数据库的密码。 |
| [`QueryTimeout: String = "query_timeout"`](field-querytimeout.md) | 获取 query 操作的超时时间，单位 ms。 |
| [`SSLCA: String = "ssl.ca"`](field-sslca.md) | 证书颁发机构（ CA ）证书文件的路径名。 |
| [`SSLCert: String = "ssl.cert"`](field-sslcert.md) | 客户端 SSL 公钥证书文件的路径名。 |
| [`SSLKey: String = "ssl.key"`](field-sslkey.md) | 客户端 SSL 私钥文件的路径名。 |
| [`SSLKeyPassword: String = "ssl.key.password"`](field-sslkeypassword.md) | 客户端 SSL 私钥文件的密码。 |
| [`SSLMode: String = "ssl.mode"`](field-sslmode.md) | 获取 SSLMode 传输层加密模式。 |
| [`SSLModeDisabled: String = "ssl.mode.disabled"`](field-sslmodedisabled.md) | 建立未加密的连接。 |
| [`SSLModePreferred: String = "ssl.mode.preferred"`](field-sslmodepreferred.md) | 如果服务器支持加密连接，则建立加密连接；如果无法建立加密连接，则回退到未加密连接，这是 SSLMode 的默认值。 |
| [`SSLModeRequired: String = "ssl.mode.required"`](field-sslmoderequired.md) | 如果服务器支持加密连接，则建立加密连接。 |
| [`SSLModeVerifyCA: String = "ssl.mode.verify_ca"`](field-sslmodeverifyca.md) | SSLModeVerifyCA 和 SSLModeRequired 类似，但是增加了校验服务器证书，如果校验失败，则连接失败。 |
| [`SSLModeVerifyFull: String = "ssl.mode.verify_full"`](field-sslmodeverifyfull.md) | SSLModeVerifyFull 和 SSLModeVerifyCA 类似，但通过验证服务器证书中的标识与客户端连接的主机名是否匹配，来执行主机名身份验证。 |
| [`SSLSni: String = "ssl.sni"`](field-sslsni.md) | 客户端通过该标识在握手过程开始时试图连接到哪个主机名。 |
| [`Tls12Ciphersuites: String = "tls1.2.ciphersuites"`](field-tls12ciphersuites.md) | 此选项指定客户端允许使用 TLSv1.2 及以下的加密连接使用哪些密码套件。 |
| [`Tls13Ciphersuites: String = "tls1.3.ciphersuites"`](field-tls13ciphersuites.md) | 此选项指定客户端允许使用 TLSv1.3 的加密连接使用哪些密码套件。 |
| [`TlsVersion: String = "tls.version"`](field-tlsversion.md) | 支持的 TLS 版本号，值为逗号分隔的字符串，比如 "TLSv1.2,TLSv1.3"。 |
| [`UpdateTimeout: String = "update_timeout"`](field-updatetimeout.md) | 获取 update 操作的超时时间，单位 ms。 |
| [`URL: String = "url"`](field-url.md) | 获取数据库连接 URL 字符串。 |
| [`Username: String = "username"`](field-username.md) | 获取连接数据库的用户名。 |
