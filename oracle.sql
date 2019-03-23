1. start with ... connect by prior ...
select SM_ID from tsys_menu 
start with sm_id = '7CA0CAAB3E652E7CE050007F01002C3C' connect by prior sm_id = sm_parent_id


