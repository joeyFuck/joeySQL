--1��
--create procedure #GetProject
--as
--select top(1000) * from JC_Project 
--go

--execute #GetProject
--2���з���ֵ
--create procedure #GetModifyRes
--as
--update JC_Project set ProName = 'joeyTracy' where ID = '52267FF8-9D99-E611-8867-38D547011054'
--return @@rowcount
--go
 
--execute #GetModifyRes
--�����@@rowcountΪִ�д洢����Ӱ���������ִ�еĽ���ǲ���������һ�����ݣ���������һ��ֵ�� return value =1  ����������ڳ����л�ȡ���Ժ���c#���ô洢�����л���˵����

--3���������������

--create procedure #ModifyPro
--@proID varchar(50),
--@proName varchar(20),
--@createTime date output --�������
--as
--update JC_Project set ProName = @proName where ID = @proID
--select @createTime =createtime from JC_Project where ID = @proID 
--go

--execute #ModifyPro '52267FF8-9D99-E611-8867-38D547011054','joeyTracy2',null

--4��ͬʱ���ز���������ֵ�ͼ�¼���Ĵ洢���� 
--create Procedure #GetProAccountRe
--@ProID varchar(50),
--@ProName varchar(50) output
--as
--if(@ProID>'5')
--select @ProName=ProName from JC_Project where ID = @ProID
--else
--set @ProName='��'
--select top(1000) * from JC_Project
--return @@rowcount
--go

--execute #GetProAccountRe '52267FF8-9D99-E611-8867-38D547011054',null

--drop procedure procedure_name  --ɾ���洢����

--5�����ض�������
--create procedure #GetMultiRes
--as
--select top 1000 * from JC_Project
--select top 1000 * from JC_User
--go

--execute #GetMultiRes


--�﷨
--------------�����洢����-----------------
/* 
CREATE PROC [ EDURE ] procedure_name [ ; number ]
    [ { @parameter data_type }
        [ VARYING ] [ = default ] [ OUTPUT ]
    ] [ ,...n ]

[ WITH
    { RECOMPILE | ENCRYPTION | RECOMPILE , ENCRYPTION } ]

[ FOR REPLICATION ]

AS sql_statement [ ...n ]

--------------���ô洢����-----------------

EXECUTE Procedure_name '' --�洢��������в���������Ӳ�����ʽΪ��@������=value��Ҳ��ֱ��Ϊ����ֵvalue

--------------ɾ���洢����-----------------

drop procedure procedure_name    --�ڴ洢�������ܵ�������һ���洢���̣�������ɾ������һ���洢����
*/

--�����洢���̵Ĳ�����
/* 
1.procedure_name ���洢���̵����ƣ���ǰ���#Ϊ�ֲ���ʱ�洢���̣���##Ϊȫ����ʱ�洢���̡�

2.; number���ǿ�ѡ��������������ͬ���Ĺ��̷��飬�Ա���һ�� DROP PROCEDURE ��伴�ɽ�ͬ��Ĺ���һ���ȥ�����磬��Ϊ orders ��Ӧ�ó���ʹ�õĹ��̿�������Ϊ orderproc;1��orderproc;2 �ȡ�DROP PROCEDURE orderproc ��佫��ȥ�����顣��������а��������ʶ���������ֲ�Ӧ�����ڱ�ʶ���У�ֻӦ�� procedure_name ǰ��ʹ���ʵ��Ķ������

3.@parameter�� �洢���̵Ĳ�����������һ���������û�������ִ�й���ʱ�ṩÿ��������������ֵ�����Ƕ����˸ò�����Ĭ��ֵ�����洢������������ 2.100 ��������
ʹ�� @ ������Ϊ��һ���ַ���ָ���������ơ��������Ʊ�����ϱ�ʶ���Ĺ���ÿ�����̵Ĳ��������ڸù��̱�����ͬ�Ĳ������ƿ����������������С�Ĭ������£�����ֻ�ܴ��泣�������������ڴ���������������������ݿ��������ơ��йظ�����Ϣ����μ� EXECUTE��

4.data_type���������������͡������������ͣ����� text��ntext �� image�������������洢���̵Ĳ�����������cursor ��������ֻ������ OUTPUT ���������ָ������������Ϊ cursor��Ҳ����ͬʱָ�� VARYING �� OUTPUT �ؼ��֡��й� SQL Server �ṩ���������ͼ����﷨�ĸ�����Ϣ����μ��������͡�
˵�� ���ڿ����� cursor �������͵����������û�������Ŀ�����ơ�

5.VARYING�� ָ����Ϊ�������֧�ֵĽ�������ɴ洢���̶�̬���죬���ݿ��Ա仯�������������α������ 

6.default�� ������Ĭ��ֵ�����������Ĭ��ֵ������ָ���ò�����ֵ����ִ�й��̡�Ĭ��ֵ�����ǳ����� NULL��������̽��Ըò���ʹ�� LIKE �ؼ��֣���ôĬ��ֵ�п��԰���ͨ�����%��_��[] �� [^]����

7.OUTPUT �����������Ƿ��ز�������ѡ���ֵ���Է��ظ� EXEC[UTE]��ʹ�� OUTPUT �����ɽ���Ϣ���ظ����ù��̡�Text��ntext �� image ���������� OUTPUT ������ʹ�� OUTPUT �ؼ��ֵ���������������α�ռλ���� 

8.RECOMPILE: ���� SQL Server ���Ỻ��ù��̵ļƻ����ù��̽�������ʱ���±��롣��ʹ�÷ǵ���ֵ����ʱֵ����ϣ�����ǻ������ڴ��е�ִ�мƻ�ʱ����ʹ�� RECOMPILE ѡ�

9.ENCRYPTION: ��ʾ SQL Server ���� syscomments ���а��� CREATE PROCEDURE ����ı�����Ŀ��ʹ�� ENCRYPTION �ɷ�ֹ��������Ϊ SQL Server ���Ƶ�һ���ַ����� ˵�� �����������У�SQL Server ���ô洢�� syscomments �еļ���ע�������´������ܹ��̡� 

10.FOR REPLICATION :ָ�������ڶ��ķ�������ִ��Ϊ���ƴ����Ĵ洢���̡�.ʹ�� FOR REPLICATION ѡ����Ĵ洢���̿������洢����ɸѡ����ֻ���ڸ��ƹ�����ִ�С���ѡ��ܺ� WITH RECOMPILE ѡ��һ��ʹ�á� 

11.AS :ָ������Ҫִ�еĲ�����

12.sql_statement :������Ҫ������������Ŀ�����͵� Transact-SQL ��䡣����һЩ���ơ�
*/


































