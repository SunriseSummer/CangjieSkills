<!-- cj-doc kind="api-package" level="4" id="std.ast" parent="api.std" -->
# std.ast

[← std 包索引](../index.md)

提供源码解析函数及抽象语法树节点。

包路径：`std.ast`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`Annotation <: Node`](classes/annotation/index.md) | 表示编译器内置的注解节点。 |
| [`Argument <: Node`](classes/argument/index.md) | 表示函数调用的实参节点。 |
| [`ArrayLiteral <: Expr`](classes/arrayliteral/index.md) | 表示 Array 字面量节点。 |
| [`AsExpr <: Expr`](classes/asexpr/index.md) | 表示一个类型检查表达式。 |
| [`AssignExpr <: Expr`](classes/assignexpr/index.md) | 表示赋值表达式节点。 |
| [`BinaryExpr <: Expr`](classes/binaryexpr/index.md) | 表示一个二元操作表达式节点。 |
| [`Block <: Expr`](classes/block/index.md) | 表示块节点。 |
| [`Body <: Node`](classes/body/index.md) | 表示 Class 类型、 Struct 类型、 Interface 类型以及扩展中由 `{}` 和内部的一组声明节点组成的结构。 |
| [`CallExpr <: Expr`](classes/callexpr/index.md) | 表示函数调用表达式；`callFunc` 是被调用表达式，`arguments` 是实参列表。 |
| [`ClassDecl <: Decl`](classes/classdecl/index.md) | 类定义节点。 |
| [`ConstPattern <: Pattern`](classes/constpattern/index.md) | 表示常量模式节点。 |
| [`Constructor <: Node`](classes/constructor/index.md) | 表示 `enum` 类型中的 Constructor 节点。 |
| [`open Decl <: Node`](classes/decl/index.md) | 所有声明节点的父类，继承自 Node 节点，提供了所有声明节点的通用接口。 |
| [`DoWhileExpr <: Expr`](classes/dowhileexpr/index.md) | 表示 `do-while` 表达式。 |
| [`EnumDecl <: Decl`](classes/enumdecl/index.md) | 表示一个 `Enum` 定义节点。 |
| [`EnumPattern <: Pattern`](classes/enumpattern/index.md) | 表示 enum 模式节点。 |
| [`ExceptTypePattern <: Pattern`](classes/excepttypepattern/index.md) | 表示一个用于异常模式状态下的节点。 |
| [`open Expr <: Node`](classes/expr/index.md) | 所有表达式节点的父类，继承自 Node 节点。 |
| [`ExtendDecl <: Decl`](classes/extenddecl/index.md) | 表示一个扩展定义节点。 |
| [`ForInExpr <: Expr`](classes/forinexpr/index.md) | 表示 `for-in` 表达式。 |
| [`FuncDecl <: Decl`](classes/funcdecl/index.md) | 表示一个函数定义节点。 |
| [`open FuncParam <: Decl`](classes/funcparam/index.md) | 表示函数参数节点，包括非命名参数和命名参数。 |
| [`FuncType <: TypeNode`](classes/functype/index.md) | 表示函数类型节点。 |
| [`GenericConstraint <: Node`](classes/genericconstraint/index.md) | 表示一个泛型约束节点。 |
| [`GenericParam <: Node`](classes/genericparam/index.md) | 表示一个类型形参节点。 |
| [`IfExpr <: Expr`](classes/ifexpr/index.md) | 表示条件表达式。 |
| [`ImportContent <: Node`](classes/importcontent/index.md) | Node |
| [`ImportList <: Node`](classes/importlist/index.md) | 表示包导入节点。 |
| [`IncOrDecExpr <: Expr`](classes/incordecexpr/index.md) | 表示包含自增操作符（`++`）或自减操作符（`--`）的表达式。 |
| [`InterfaceDecl <: Decl`](classes/interfacedecl/index.md) | 表示接口定义节点。 |
| [`IsExpr <: Expr`](classes/isexpr/index.md) | 表示一个类型检查表达式。 |
| [`JumpExpr <: Expr`](classes/jumpexpr/index.md) | 表示循环表达式的循环体中的 `break` 和 `continue`。 |
| [`LambdaExpr <: Expr`](classes/lambdaexpr/index.md) | 表示 `Lambda` 表达式，是一个匿名的函数。 |
| [`LetPatternExpr <: Expr`](classes/letpatternexpr/index.md) | 表示 `let` 声明的解构匹配节点。 |
| [`LitConstExpr <: Expr`](classes/litconstexpr/index.md) | 表示一个常量表达式节点。 |
| [`MacroDecl <: Decl`](classes/macrodecl/index.md) | 表示一个宏定义节点。 |
| [`MacroExpandDecl <: Decl`](classes/macroexpanddecl/index.md) | 表示宏调用节点。 |
| [`MacroExpandExpr <: Expr`](classes/macroexpandexpr/index.md) | 表示宏调用节点。 |
| [`MacroExpandParam <: FuncParam`](classes/macroexpandparam/index.md) | 表示宏调用节点。 |
| [`MacroMessage`](classes/macromessage/index.md) | 记录内层宏发送的信息。 |
| [`MainDecl <: Decl`](classes/maindecl/index.md) | 表示一个 `main` 函数定义节点。 |
| [`MatchCase <: Node`](classes/matchcase/index.md) | 表示 `match` 表达式中的一个 `case` 节点。 |
| [`MatchExpr <: Expr`](classes/matchexpr/index.md) | 表示模式匹配表达式实现模式匹配。 |
| [`MemberAccess <: Expr`](classes/memberaccess/index.md) | 表示成员访问表达式。 |
| [`Modifier <: Node`](classes/modifier/index.md) | 表示该定义具备某些特性，通常放在定义处的最前端。 |
| [`abstract sealed Node <: ToTokens`](classes/node/index.md) | 所有仓颉语法树节点的父类。 |
| [`OptionalExpr <: Expr`](classes/optionalexpr/index.md) | 表示一个带有问号操作符的表达式节点。 |
| [`PackageHeader <: Node`](classes/packageheader/index.md) | 表示包声明节点。 |
| [`ParenExpr <: Expr`](classes/parenexpr/index.md) | 表示一个括号表达式节点，是指使用圆括号括起来的表达式。 |
| [`ParenType <: TypeNode`](classes/parentype/index.md) | 表示括号类型节点。 |
| [`open Pattern <: Node`](classes/pattern/index.md) | 所有模式匹配节点的父类，继承自 Node 节点。 |
| [`PrefixType <: TypeNode`](classes/prefixtype/index.md) | 表示带问号的前缀类型节点。 |
| [`PrimaryCtorDecl <: Decl`](classes/primaryctordecl/index.md) | 表示一个主构造函数节点。 |
| [`PrimitiveType <: TypeNode`](classes/primitivetype/index.md) | 表示一个基本类型节点。 |
| [`PrimitiveTypeExpr <: Expr`](classes/primitivetypeexpr/index.md) | 表示基本类型表达式节点。 |
| [`Program <: Node`](classes/program/index.md) | 表示一个仓颉源码文件节点。 |
| [`PropDecl <: Decl`](classes/propdecl/index.md) | 表示一个属性定义节点。 |
| [`QualifiedType <: TypeNode`](classes/qualifiedtype/index.md) | 表示一个用户自定义成员类型。 |
| [`QuoteExpr <: Expr`](classes/quoteexpr/index.md) | 表示 `quote` 表达式节点。 |
| [`QuoteToken <: Expr`](classes/quotetoken/index.md) | 表示 `quote` 表达式节点内任意合法的 `token`。 |
| [`RangeExpr <: Expr`](classes/rangeexpr/index.md) | 表示包含区间操作符的表达式。 |
| [`RefExpr <: Expr`](classes/refexpr/index.md) | 表示引用一个声明的表达式节点。 |
| [`RefType <: TypeNode`](classes/reftype/index.md) | 表示一个非基础类型节点。 |
| [`ReturnExpr <: Expr`](classes/returnexpr/index.md) | 表示 `return` 表达式节点。 |
| [`SpawnExpr <: Expr`](classes/spawnexpr/index.md) | 表示 `Spawn` 表达式。 |
| [`StructDecl <: Decl`](classes/structdecl/index.md) | 表示一个 `Struct` 节点。 |
| [`SubscriptExpr <: Expr`](classes/subscriptexpr/index.md) | 表示索引访问表达式。 |
| [`SynchronizedExpr <: Expr`](classes/synchronizedexpr/index.md) | 表示 `synchronized` 表达式。 |
| [`ThisType <: TypeNode`](classes/thistype/index.md) | 表示 `This` 类型节点。 |
| [`ThrowExpr <: Expr`](classes/throwexpr/index.md) | 表示 `throw` 表达式节点。 |
| [`open Tokens <: ToString & Iterable<Token> & ToBytes`](classes/tokens/index.md) | 对 Token 序列进行封装的类型。 |
| [`TokensIterator <: Iterator<Token>`](classes/tokensiterator/index.md) | 实现 Tokens 的迭代器功能。 |
| [`TrailingClosureExpr <: Expr`](classes/trailingclosureexpr/index.md) | 表示尾随 `Lambda` 节点。 |
| [`TryExpr <: Expr`](classes/tryexpr/index.md) | 表示 `try` 表达式节点。 |
| [`TupleLiteral <: Expr`](classes/tupleliteral/index.md) | 表示元组字面量节点。 |
| [`TuplePattern <: Pattern`](classes/tuplepattern/index.md) | 表示 Tuple 模式节点。 |
| [`TupleType <: TypeNode`](classes/tupletype/index.md) | 表示元组类型节点。 |
| [`TypeAliasDecl <: Decl`](classes/typealiasdecl/index.md) | 表示类型别名节点。 |
| [`TypeConvExpr <: Expr`](classes/typeconvexpr/index.md) | 表示类型转换表达式。 |
| [`open TypeNode <: Node`](classes/typenode/index.md) | 所有类型节点的父类，继承自 Node。 |
| [`TypePattern <: Pattern`](classes/typepattern/index.md) | 表示类型模式节点。 |
| [`UnaryExpr <: Expr`](classes/unaryexpr/index.md) | 表示一个一元操作表达式节点。 |
| [`VArrayExpr <: Expr`](classes/varrayexpr/index.md) | 表示 `VArray` 的实例节点。 |
| [`VArrayType <: TypeNode`](classes/varraytype/index.md) | 表示 `VArray` 类型节点。 |
| [`VarDecl <: Decl`](classes/vardecl/index.md) | 表示变量定义节点。 |
| [`VarOrEnumPattern <: Pattern`](classes/varorenumpattern/index.md) | 表示当模式的标识符为 `Enum` 构造器时的节点。 |
| [`VarPattern <: Pattern`](classes/varpattern/index.md) | 表示绑定模式节点。 |
| [`abstract Visitor`](classes/visitor/index.md) | 一个抽象类，其内部默认定义了访问不同类型 AST 节点访问（`visit`）函数。 |
| [`WhileExpr <: Expr`](classes/whileexpr/index.md) | 表示 `while` 表达式。 |
| [`WildcardExpr <: Expr`](classes/wildcardexpr/index.md) | 表示通配符表达式节点。 |
| [`WildcardPattern <: Pattern`](classes/wildcardpattern/index.md) | 表示通配符模式节点。 |
| [`ASTException <: Exception`](classes/astexception/index.md) | ast 库的异常类，在 ast 库调用过程中发生异常时使用。 |
| [`MacroContextException <: Exception`](classes/macrocontextexception/index.md) | ast 库的上下文宏异常类，在上下文宏的相关接口中发生异常时使用。 |
| [`ParseASTException <: Exception`](classes/parseastexception/index.md) | ast 库的解析异常类，在节点解析过程中发生异常时使用。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`ToBytes`](interfaces/tobytes/index.md) | 提供对应类型的序列化功能。 |
| [`ToTokens`](interfaces/totokens/index.md) | 实现对应类型的实例到 Tokens 类型转换的接口，作为支持 `quote` 插值操作必须实现的接口。 |

## 结构体

| 声明 | 功能 |
|---|---|
| [`Position <: ToBytes`](structs/position/index.md) | 表示位置信息的数据结构，包含文件 ID、行号和列号。 |
| [`Token <: ToBytes`](structs/token/index.md) | 词法单元类型。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`DiagReportLevel`](enums/diagreportlevel/index.md) | 表示报错接口的信息等级，支持 `ERROR` 和 `WARNING` 两种等级。 |
| [`ImportKind <: ToString`](enums/importkind/index.md) | 表示导入语句的类型。 |
| [`TokenKind <: ToString`](enums/tokenkind/index.md) | 表示仓颉编译内部所有的词法结构，包括符号、关键字、标识符、换行等。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`assertParentContext(parentMacroName: String): Unit`](functions/assertparentcontext-string.md) | 检查当前宏调用是否在特定的宏调用内。 |
| [`cangjieLex(…) — 2 个重载`](functions/cangjielex.md) | 将字符串转换为 Tokens 对象。 |
| [`compareTokens(tokens1: Tokens, tokens2: Tokens): Bool`](functions/comparetokens-tokens-tokens.md) | 用于比较两个 Tokens 是否一致。 |
| [`diagReport(level: DiagReportLevel, tokens: Tokens, message: String, hint: String): Unit`](functions/diagreport-diagreportlevel-tokens-string-string.md) | 报错接口，在编译过程的宏展开阶段输出错误提示信息，支持 `WARNING` 和 `ERROR` 两个等级的报错。 |
| [`getChildMessages(children:String): ArrayList<MacroMessage>`](functions/getchildmessages-string.md) | 获取特定内层宏发送的信息。 |
| [`getTokenKind(no: UInt16): TokenKind`](functions/gettokenkind-uint16.md) | 将词法单元种类序号转化为 TokenKind。 |
| [`insideParentContext(parentMacroName: String): Bool`](functions/insideparentcontext-string.md) | 检查当前宏调用是否在特定的宏调用内，返回一个布尔值。 |
| [`parseDecl(input: Tokens, astKind!: String = ""): Decl`](functions/parsedecl-tokens-string.md) | 用于解析一组词法单元，获取一个 Decl 类型的节点。 |
| [`parseDeclFragment(input: Tokens, startFrom !: Int64 = 0): (Decl, Int64)`](functions/parsedeclfragment-tokens-int64.md) | 用于解析一组词法单元，获取一个 Decl 类型的节点和继续解析节点的索引。 |
| [`parseExpr(input: Tokens): Expr`](functions/parseexpr-tokens.md) | 用于解析一组词法单元，获取一个 Expr 类型的节点。 |
| [`parseExprFragment(input: Tokens, startFrom !: Int64 = 0): (Expr, Int64)`](functions/parseexprfragment-tokens-int64.md) | 用于解析一组词法单元，获取一个 Expr 类型的节点和继续解析节点的索引。 |
| [`parsePattern(input: Tokens): Pattern`](functions/parsepattern-tokens.md) | 用于解析一组词法单元，获取一个 Pattern 类型的节点。 |
| [`parsePatternFragment(input: Tokens, startFrom !: Int64 = 0): (Pattern, Int64)`](functions/parsepatternfragment-tokens-int64.md) | 用于解析一组词法单元，获取一个 Pattern 类型的节点和继续解析节点的索引。 |
| [`parseProgram(input: Tokens): Program`](functions/parseprogram-tokens.md) | 用于解析单个仓颉文件的源码，获取一个 Program 类型的节点。 |
| [`parseType(input: Tokens): TypeNode`](functions/parsetype-tokens.md) | 用于解析一组词法单元，获取一个 TypeNode 类型的节点。 |
| [`parseTypeFragment(input: Tokens, startFrom !: Int64 = 0): (TypeNode, Int64)`](functions/parsetypefragment-tokens-int64.md) | 用于解析一组词法单元，获取一个 TypeNode 类型的节点和继续解析节点的索引。 |
| [`setItem(…) — 4 个重载`](functions/setitem.md) | 内层宏通过该接口发送 Bool 类型的信息到外层宏。 |
