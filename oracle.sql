1. start with ... connect by prior ...
select SM_ID from tsys_menu 
start with sm_id = '7CA0CAAB3E652E7CE050007F01002C3C' connect by prior sm_id = sm_parent_id

2. SYS_CONNECT_BY_PATH 把对应的值用‘-’进行连接，regexp_replace：替换函数
select regexp_replace(SYS_CONNECT_BY_PATH(name,'-'),'-','') as name from tregion t   
where  code in (select O_REGION from tcorp  where O_CODE = 'CP20150815173226408')    
start with p_code = 100000   connect by prior code = P_code;
