<!-- cj-doc kind="api-type" level="5" id="std.ast.enum.tokenkind" parent="std.ast" -->
# TokenKind

[← std.ast](../../index.md)

`TokenKind <: ToString`

表示仓颉编译内部所有的词法结构，包括符号、关键字、标识符、换行等。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`ABSTRACT`](value-abstract.md) | 构造一个表示 `abstract` 的枚举实例。 |
| [`ADD`](value-add.md) | 构造一个表示 `+` 的枚举实例。 |
| [`ADD_ASSIGN`](value-add_assign.md) | 构造一个表示 `+=` 的枚举实例。 |
| [`AND`](value-and.md) | 构造一个表示 `&&` 的枚举实例。 |
| [`AND_ASSIGN`](value-and_assign.md) | 构造一个表示 `&&=` 的枚举实例。 |
| [`ANNOTATION`](value-annotation.md) | 构造一个表示*注解*的枚举实例。 |
| [`ARROW`](value-arrow.md) | 构造一个表示 `->` 的枚举实例。 |
| [`AS`](value-as.md) | 构造一个表示 `as` 的枚举实例。 |
| [`ASSIGN`](value-assign.md) | 构造一个表示 `=` 的枚举实例。 |
| [`AT`](value-at.md) | 构造一个表示 `@` 的枚举实例。 |
| [`AT_EXCL`](value-at_excl.md) | 构造一个表示 `@!` 的枚举实例。 |
| [`BACKARROW`](value-backarrow.md) | 构造一个表示 `<-` 的枚举实例。 |
| [`BITAND`](value-bitand.md) | 构造一个表示 `&` 的枚举实例。 |
| [`BITAND_ASSIGN`](value-bitand_assign.md) | 构造一个表示 `&=` 的枚举实例。 |
| [`BITNOT`](value-bitnot.md) | 构造一个表示 `~` 的枚举实例。 |
| [`BITOR`](value-bitor.md) | 构造一个表示 `\|` 的枚举实例。 |
| [`BITOR_ASSIGN`](value-bitor_assign.md) | 构造一个表示 `\|=` 的枚举实例。 |
| [`BITXOR`](value-bitxor.md) | 构造一个表示 `^` 的枚举实例。 |
| [`BITXOR_ASSIGN`](value-bitxor_assign.md) | 构造一个表示 `^=` 的枚举实例。 |
| [`BOOLEAN`](value-boolean.md) | 构造一个表示 `bool` 的枚举实例。 |
| [`BOOL_LITERAL`](value-bool_literal.md) | 构造一个表示*布尔类型字面量*的枚举实例。 |
| [`BREAK`](value-break.md) | 构造一个表示 `break` 的枚举实例。 |
| [`CASE`](value-case.md) | 构造一个表示 `case` 的枚举实例。 |
| [`CATCH`](value-catch.md) | 构造一个表示 `catch` 的枚举实例。 |
| [`CLASS`](value-class.md) | 构造一个表示 `class` 的枚举实例。 |
| [`CLOSEDRANGEOP`](value-closedrangeop.md) | 构造一个表示 `..=` 的枚举实例。 |
| [`COALESCING`](value-coalescing.md) | 构造一个表示 `??` 的枚举实例。 |
| [`COLON`](value-colon.md) | 构造一个表示 `:` 的枚举实例。 |
| [`COMMA`](value-comma.md) | 构造一个表示 `,` 的枚举实例。 |
| [`COMMENT`](value-comment.md) | 构造一个表示*注释*的枚举实例。 |
| [`COMPOSITION`](value-composition.md) | 构造一个表示 `~>` 的枚举实例。 |
| [`CONST`](value-const.md) | 构造一个表示 `const` 的枚举实例。 |
| [`CONTINUE`](value-continue.md) | 构造一个表示 `continue` 的枚举实例。 |
| [`DECR`](value-decr.md) | 构造一个表示 `--` 的枚举实例。 |
| [`DIV`](value-div.md) | 构造一个表示 `/` 的枚举实例。 |
| [`DIV_ASSIGN`](value-div_assign.md) | 构造一个表示 `/=` 的枚举实例。 |
| [`DO`](value-do.md) | 构造一个表示 `do` 的枚举实例。 |
| [`DOLLAR`](value-dollar.md) | 构造一个表示 `$` 的枚举实例。 |
| [`DOLLAR_IDENTIFIER`](value-dollar_identifier.md) | 构造一个表示*插值字符串*的枚举实例。 |
| [`DOT`](value-dot.md) | 构造一个表示 `.` 的枚举实例。 |
| [`DOUBLE_ARROW`](value-double_arrow.md) | 构造一个表示 `=>` 的枚举实例。 |
| [`ELLIPSIS`](value-ellipsis.md) | 构造一个表示 `...` 的枚举实例。 |
| [`ELSE`](value-else.md) | 构造一个表示 `else` 的枚举实例。 |
| [`END`](value-end.md) | 构造一个表示 `EOF` 的枚举实例。 |
| [`ENUM`](value-enum.md) | 构造一个表示 `enum` 的枚举实例。 |
| [`EQUAL`](value-equal.md) | 构造一个表示 `==` 的枚举实例。 |
| [`EXP`](value-exp.md) | 构造一个表示 `**` 的枚举实例。 |
| [`EXP_ASSIGN`](value-exp_assign.md) | 构造一个表示 `**=` 的枚举实例。 |
| [`FINALLY`](value-finally.md) | 构造一个表示 `finally` 的枚举实例。 |
| [`FLOAT16`](value-float16.md) | 构造一个表示 `float16` 的枚举实例。 |
| [`FLOAT32`](value-float32.md) | 构造一个表示 `float32` 的枚举实例。 |
| [`FLOAT64`](value-float64.md) | 构造一个表示 `float64` 的枚举实例。 |
| [`FLOAT_LITERAL`](value-float_literal.md) | 构造一个表示*浮点字面量*的枚举实例。 |
| [`FOR`](value-for.md) | 构造一个表示 `for` 的枚举实例。 |
| [`FOREIGN`](value-foreign.md) | 构造一个表示 `foreign` 的枚举实例。 |
| [`FUNC`](value-func.md) | 构造一个表示 `func` 的枚举实例。 |
| [`GE`](value-ge.md) | 构造一个表示 `>=` 的枚举实例。 |
| [`GT`](value-gt.md) | 构造一个表示 `>` 的枚举实例。 |
| [`HASH`](value-hash.md) | 构造一个表示 `#` 的枚举实例。 |
| [`IDENTIFIER`](value-identifier.md) | 构造一个表示*标识符*的枚举实例。 |
| [`PACKAGE_IDENTIFIER`](value-package_identifier.md) | 构造一个表示*包标识符*的枚举实例。 |
| [`IF`](value-if.md) | 构造一个表示 `if` 的枚举实例。 |
| [`ILLEGAL`](value-illegal.md) | 构造一个表示*非法*的枚举实例。 |
| [`IMPORT`](value-import.md) | 构造一个表示 `import` 的枚举实例。 |
| [`IN`](value-in.md) | 构造一个表示 `in` 的枚举实例。 |
| [`INCR`](value-incr.md) | 构造一个表示 `++` 的枚举实例。 |
| [`INIT`](value-init.md) | 构造一个表示 `init` 的枚举实例。 |
| [`INOUT`](value-inout.md) | 构造一个表示 `inout` 的枚举实例。 |
| [`INT16`](value-int16.md) | 构造一个表示 `int16` 的枚举实例。 |
| [`INT32`](value-int32.md) | 构造一个表示 `int32` 的枚举实例。 |
| [`INT64`](value-int64.md) | 构造一个表示 `int64` 的枚举实例。 |
| [`INT8`](value-int8.md) | 构造一个表示 `int8` 的枚举实例。 |
| [`INTEGER_LITERAL`](value-integer_literal.md) | 构造一个表示*整型字面量*的枚举实例。 |
| [`INTERFACE`](value-interface.md) | 构造一个表示 `interface` 的枚举实例。 |
| [`INTERNAL`](value-internal.md) | 构造一个表示 `internal` 的枚举实例。 |
| [`INTNATIVE`](value-intnative.md) | 构造一个表示 `intnative` 的枚举实例。 |
| [`IS`](value-is.md) | 构造一个表示 `is` 的枚举实例。 |
| [`JSTRING_LITERAL`](value-jstring_literal.md) | 构造一个表示 Java String 字面量的枚举实例。 |
| [`LCURL`](value-lcurl.md) | 构造一个表示 `{` 的枚举实例。 |
| [`LE`](value-le.md) | 构造一个表示 `<=` 的枚举实例。 |
| [`LET`](value-let.md) | 构造一个表示 `let` 的枚举实例。 |
| [`LPAREN`](value-lparen.md) | 构造一个表示 `(` 的枚举实例。 |
| [`LSHIFT`](value-lshift.md) | 构造一个表示 `<<` 的枚举实例。 |
| [`LSHIFT_ASSIGN`](value-lshift_assign.md) | 构造一个表示 `<<=` 的枚举实例。 |
| [`LSQUARE`](value-lsquare.md) | 构造一个表示 `[` 的枚举实例。 |
| [`LT`](value-lt.md) | 构造一个表示 `<` 的枚举实例。 |
| [`MACRO`](value-macro.md) | 构造一个表示 `macro` 的枚举实例。 |
| [`MAIN`](value-main.md) | 构造一个表示 `main` 的枚举实例。 |
| [`MATCH`](value-match.md) | 构造一个表示 `match` 的枚举实例。 |
| [`MOD`](value-mod.md) | 构造一个表示 `%` 的枚举实例。 |
| [`MOD_ASSIGN`](value-mod_assign.md) | 构造一个表示 `%=` 的枚举实例。 |
| [`MUL`](value-mul.md) | 构造一个表示 `*` 的枚举实例。 |
| [`MULTILINE_RAW_STRING`](value-multiline_raw_string.md) | 构造一个表示*多行原始字符串字面量*的枚举实例。 |
| [`MULTILINE_STRING`](value-multiline_string.md) | 构造一个表示*多行字符串字面量*的枚举实例。 |
| [`MUL_ASSIGN`](value-mul_assign.md) | 构造一个表示 `*=` 的枚举实例。 |
| [`MUT`](value-mut.md) | 构造一个表示 `mut` 的枚举实例。 |
| [`NL`](value-nl.md) | 构造一个表示*换行符*的枚举实例。 |
| [`NOT`](value-not.md) | 构造一个表示 `!` 的枚举实例。 |
| [`NOTEQ`](value-noteq.md) | 构造一个表示 `!=` 的枚举实例。 |
| [`NOTHING`](value-nothing.md) | 构造一个表示 `nothing` 的枚举实例。 |
| [`NOT_IN`](value-not_in.md) | 构造一个表示 `!in` 的枚举实例。 |
| [`OPEN`](value-open.md) | 构造一个表示 `open` 的枚举实例。 |
| [`OPERATOR`](value-operator.md) | 构造一个表示 `operator` 的枚举实例。 |
| [`OR`](value-or.md) | 构造一个表示 `\|\|` 的枚举实例。 |
| [`OR_ASSIGN`](value-or_assign.md) | 构造一个表示 `\|\|=` 的枚举实例。 |
| [`OVERRIDE`](value-override.md) | 构造一个表示 `override` 的枚举实例。 |
| [`PACKAGE`](value-package.md) | 构造一个表示 `package` 的枚举实例。 |
| [`PIPELINE`](value-pipeline.md) | 构造一个表示 `\|>` 的枚举实例。 |
| [`PRIVATE`](value-private.md) | 构造一个表示 `private` 的枚举实例。 |
| [`PROP`](value-prop.md) | 构造一个表示 `prop` 的枚举实例。 |
| [`PROTECTED`](value-protected.md) | 构造一个表示 `protected` 的枚举实例。 |
| [`PUBLIC`](value-public.md) | 构造一个表示 `public` 的枚举实例。 |
| [`QUEST`](value-quest.md) | 构造一个表示 `?` 的枚举实例。 |
| [`QUOTE`](value-quote.md) | 构造一个表示 `quote` 的枚举实例。 |
| [`RANGEOP`](value-rangeop.md) | 构造一个表示 `..` 的枚举实例。 |
| [`RCURL`](value-rcurl.md) | 构造一个表示 `}` 的枚举实例。 |
| [`REDEF`](value-redef.md) | 构造一个表示 `redef` 的枚举实例。 |
| [`RETURN`](value-return.md) | 构造一个表示 `return` 的枚举实例。 |
| [`RPAREN`](value-rparen.md) | 构造一个表示 `)` 的枚举实例。 |
| [`RSHIFT`](value-rshift.md) | 构造一个表示 `>>` 的枚举实例。 |
| [`RSHIFT_ASSIGN`](value-rshift_assign.md) | 构造一个表示 `>>=` 的枚举实例。 |
| [`RSQUARE`](value-rsquare.md) | 构造一个表示 `]` 的枚举实例。 |
| [`RUNE`](value-rune.md) | 构造一个表示 `Rune` 的枚举实例。 |
| [`RUNE_BYTE_LITERAL`](value-rune_byte_literal.md) | 构造一个表示*字符字节字面量*的枚举实例。 |
| [`RUNE_LITERAL`](value-rune_literal.md) | 构造一个表示*字符字面量*的枚举实例。 |
| [`SEALED`](value-sealed.md) | 构造一个表示 `sealed` 的枚举实例。 |
| [`SEMI`](value-semi.md) | 构造一个表示 `;` 的枚举实例。 |
| [`SENTINEL`](value-sentinel.md) | 构造一个表示 `;` 的枚举实例。 |
| [`SINGLE_QUOTED_STRING_LITERAL`](value-single_quoted_string_literal.md) | 构造一个表示*单引号字符串字面量*的枚举实例。 |
| [`SPAWN`](value-spawn.md) | 构造一个表示 `spawn` 的枚举实例。 |
| [`STATIC`](value-static.md) | 构造一个表示 `static` 的枚举实例。 |
| [`STRING_LITERAL`](value-string_literal.md) | 构造一个表示*双引号字符串字面量*的枚举实例。 |
| [`STRUCT`](value-struct.md) | 构造一个表示 `struct` 的枚举实例。 |
| [`SUB`](value-sub.md) | 构造一个表示 `-` 的枚举实例。 |
| [`SUB_ASSIGN`](value-sub_assign.md) | 构造一个表示 `-=` 的枚举实例。 |
| [`SUPER`](value-super.md) | 构造一个表示 `super` 的枚举实例。 |
| [`SYNCHRONIZED`](value-synchronized.md) | 构造一个表示 `synchronized` 的枚举实例。 |
| [`THIS`](value-this.md) | 构造一个表示 `this` 的枚举实例。 |
| [`THISTYPE`](value-thistype.md) | 构造一个表示 `This` 的枚举实例。 |
| [`THROW`](value-throw.md) | 构造一个表示 `throw` 的枚举实例。 |
| [`TRY`](value-try.md) | 构造一个表示 `try` 的枚举实例。 |
| [`TYPE`](value-type.md) | 构造一个表示 `type` 的枚举实例。 |
| [`UINT16`](value-uint16.md) | 构造一个表示 `uint16` 的枚举实例。 |
| [`UINT32`](value-uint32.md) | 构造一个表示 `uint32` 的枚举实例。 |
| [`UINT64`](value-uint64.md) | 构造一个表示 `uint64` 的枚举实例。 |
| [`UINT8`](value-uint8.md) | 构造一个表示 `uint8` 的枚举实例。 |
| [`UINTNATIVE`](value-uintnative.md) | 构造一个表示 `uintnative` 的枚举实例。 |
| [`UNIT`](value-unit.md) | 构造一个表示 `unit` 的枚举实例。 |
| [`UNIT_LITERAL`](value-unit_literal.md) | 构造一个表示 `unit` 字面量的枚举实例。 |
| [`UNSAFE`](value-unsafe.md) | 构造一个表示 `unsafe` 的枚举实例。 |
| [`UPPERBOUND`](value-upperbound.md) | 构造一个表示 `<:` 的枚举实例。 |
| [`VAR`](value-var.md) | 构造一个表示 `var` 的枚举实例。 |
| [`VARRAY`](value-varray.md) | 构造一个表示 `varray` 的枚举实例。 |
| [`WHERE`](value-where.md) | 构造一个表示 `where` 的枚举实例。 |
| [`WHILE`](value-while.md) | 构造一个表示 `while` 的枚举实例。 |
| [`WILDCARD`](value-wildcard.md) | 构造一个表示 `_` 的枚举实例。 |
| [`WITH`](value-with.md) | 构造一个表示 `with` 的枚举实例。 |
| [`COMMON`](value-common.md) | 构造一个表示 `common` 关键字的枚举实例。 |
| [`DOUBLE_COLON`](value-double_colon.md) | 构造一个表示 `::` 的枚举实例。 |
| [`FEATURES`](value-features.md) | 构造一个表示 `features` 关键字的枚举实例。 |
| [`HANDLE`](value-handle.md) | 构造一个表示 `handle` 的枚举实例。 |
| [`PERFORM`](value-perform.md) | 构造一个表示 `perform` 的枚举实例。 |
| [`RESUME`](value-resume.md) | 构造一个表示 `resume` 的枚举实例。 |
| [`SPECIFIC`](value-specific.md) | 构造一个表示 `specific` 的枚举实例。 |
| [`THROWING`](value-throwing.md) | 构造一个表示 `throwing` 的枚举实例。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(right: TokenKind): Bool`](operator-ne.md) | 重载不等号操作符，用于比较两个 TokenKind 是否相等。 |
| [`operator ==(right: TokenKind): Bool`](operator-eq.md) | 重载等号操作符，用于比较两个 TokenKind 是否相等。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toString(): String`](tostring.md) | 将 TokenKind 类型转化为字符串类型表示。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`EXTEND`](extensions/extend.md) | 构造一个表示 `extend` 的枚举实例。 |
