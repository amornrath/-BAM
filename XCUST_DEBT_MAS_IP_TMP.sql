--------------------------------------------------------
--  File created - Friday-October-20-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View XCUST_DEBT_MAS_IP_TMP
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "APPS"."XCUST_DEBT_MAS_IP_TMP" ("DEBT_ID", "DEBT_NO", "VENDOR_ID", "DEBT_TYPE_FIN", "START_DATE", "END_DATE", "DEBT_AMOUNT", "BALANCE_AMOUNT", "STATUS", "ORG_ID", "LAST_UPDATE_DATE", "LAST_UPDATED_BY", "CREATED_BY", "CREATION_DATE", "PAY_DATE", "DEBT_PAY_ID") AS 
  select distinct m.debt_id ,
m.DEBT_NO,
m.VENDOR_ID,
m.DEBT_TYPE_FIN,
m.START_DATE,
m.END_DATE,
m.DEBT_AMOUNT,
m.BALANCE_AMOUNT,
m.STATUS,
m.org_id,
m.LAST_UPDATE_DATE,
m.LAST_UPDATED_BY,
m.CREATED_BY,
m.CREATION_DATE,
ip.PAY_DATE
--ip.PAID_DEBT_AMOUNT,
--ip.CAL_INT,
,ip.debt_pay_id
from
XCUST_DEBT_MAS m,
xcust_debt_int_pay ip
where m.debt_id = ip.debt_id(+)
and (nvl(ip.paid_debt_amount,0) <>0 or nvl(ip.cal_int,0) <> 0);
