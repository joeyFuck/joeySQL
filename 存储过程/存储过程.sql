--1、
--create procedure #GetProject
--as
--select top(1000) * from JC_Project 
--go

--execute #GetProject
--2、有返回值
--create procedure #GetModifyRes
--as
--update JC_Project set ProName = 'joeyTracy' where ID = '52267FF8-9D99-E611-8867-38D547011054'
--return @@rowcount
--go
 
--execute #GetModifyRes
--这里的@@rowcount为执行存储过程影响的行数，执行的结果是不仅插入了一条数据，还返回了一个值即 return value =1  ，这个可以在程序中获取，稍后在c#调用存储过程中会有说到。

--3、有输入输出参数

--create procedure #ModifyPro
--@proID varchar(50),
--@proName varchar(20),
--@createTime date output --输出参数
--as
--update JC_Project set ProName = @proName where ID = @proID
--select @createTime =createtime from JC_Project where ID = @proID 
--go

--execute #ModifyPro '52267FF8-9D99-E611-8867-38D547011054','joeyTracy2',null

--4、同时返回参数、返回值和记录集的存储过程 
--create Procedure #GetProAccountRe
--@ProID varchar(50),
--@ProName varchar(50) output
--as
--if(@ProID>'5')
--select @ProName=ProName from JC_Project where ID = @ProID
--else
--set @ProName='无'
--select top(1000) * from JC_Project
--return @@rowcount
--go

--execute #GetProAccountRe '52267FF8-9D99-E611-8867-38D547011054',null

--drop procedure procedure_name  --删除存储过程

--5、返回多个结果集
--create procedure #GetMultiRes
--as
--select top 1000 * from JC_Project
--select top 1000 * from JC_User
--go

--execute #GetMultiRes


--语法
--------------创建存储过程-----------------
/* 
CREATE PROC [ EDURE ] procedure_name [ ; number ]
    [ { @parameter data_type }
        [ VARYING ] [ = default ] [ OUTPUT ]
    ] [ ,...n ]

[ WITH
    { RECOMPILE | ENCRYPTION | RECOMPILE , ENCRYPTION } ]

[ FOR REPLICATION ]

AS sql_statement [ ...n ]

--------------调用存储过程-----------------

EXECUTE Procedure_name '' --存储过程如果有参数，后面加参数格式为：@参数名=value，也可直接为参数值value

--------------删除存储过程-----------------

drop procedure procedure_name    --在存储过程中能调用另外一个存储过程，而不能删除另外一个存储过程
*/

--创建存储过程的参数：
/* 
1.procedure_name ：存储过程的名称，在前面加#为局部临时存储过程，加##为全局临时存储过程。

2.; number：是可选的整数，用来对同名的过程分组，以便用一条 DROP PROCEDURE 语句即可将同组的过程一起除去。例如，名为 orders 的应用程序使用的过程可以命名为 orderproc;1、orderproc;2 等。DROP PROCEDURE orderproc 语句将除去整个组。如果名称中包含定界标识符，则数字不应包含在标识符中，只应在 procedure_name 前后使用适当的定界符。

3.@parameter： 存储过程的参数。可以有一个或多个。用户必须在执行过程时提供每个所声明参数的值（除非定义了该参数的默认值）。存储过程最多可以有 2.100 个参数。
使用 @ 符号作为第一个字符来指定参数名称。参数名称必须符合标识符的规则。每个过程的参数仅用于该过程本身；相同的参数名称可以用在其它过程中。默认情况下，参数只能代替常量，而不能用于代替表名、列名或其它数据库对象的名称。有关更多信息，请参见 EXECUTE。

4.data_type：参数的数据类型。所有数据类型（包括 text、ntext 和 image）均可以用作存储过程的参数。不过，cursor 数据类型只能用于 OUTPUT 参数。如果指定的数据类型为 cursor，也必须同时指定 VARYING 和 OUTPUT 关键字。有关 SQL Server 提供的数据类型及其语法的更多信息，请参见数据类型。
说明 对于可以是 cursor 数据类型的输出参数，没有最大数目的限制。

5.VARYING： 指定作为输出参数支持的结果集（由存储过程动态构造，内容可以变化）。仅适用于游标参数。 

6.default： 参数的默认值。如果定义了默认值，不必指定该参数的值即可执行过程。默认值必须是常量或 NULL。如果过程将对该参数使用 LIKE 关键字，那么默认值中可以包含通配符（%、_、[] 和 [^]）。

7.OUTPUT ：表明参数是返回参数。该选项的值可以返回给 EXEC[UTE]。使用 OUTPUT 参数可将信息返回给调用过程。Text、ntext 和 image 参数可用作 OUTPUT 参数。使用 OUTPUT 关键字的输出参数可以是游标占位符。 

8.RECOMPILE: 表明 SQL Server 不会缓存该过程的计划，该过程将在运行时重新编译。在使用非典型值或临时值而不希望覆盖缓存在内存中的执行计划时，请使用 RECOMPILE 选项。

9.ENCRYPTION: 表示 SQL Server 加密 syscomments 表中包含 CREATE PROCEDURE 语句文本的条目。使用 ENCRYPTION 可防止将过程作为 SQL Server 复制的一部分发布。 说明 在升级过程中，SQL Server 利用存储在 syscomments 中的加密注释来重新创建加密过程。 

10.FOR REPLICATION :指定不能在订阅服务器上执行为复制创建的存储过程。.使用 FOR REPLICATION 选项创建的存储过程可用作存储过程筛选，且只能在复制过程中执行。本选项不能和 WITH RECOMPILE 选项一起使用。 

11.AS :指定过程要执行的操作。

12.sql_statement :过程中要包含的任意数目和类型的 Transact-SQL 语句。但有一些限制。
*/


































