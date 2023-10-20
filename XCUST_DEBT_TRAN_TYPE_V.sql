--------------------------------------------------------
--  File created - Friday-October-20-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View XCUST_DEBT_TRAN_TYPE_V
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "APPS"."XCUST_DEBT_TRAN_TYPE_V" ("ID", "CODE", "NAME") AS 
  select to_number(l.lookup_code) as debt_type_id, 
            l.meaning debt_type_code,
            l.description 
    from fnd_lookup_values_vl l
    where l.lookup_type = 'XCUST_DEBT_TRAN_TYPE'
        and l.enabled_flag = 'Y'
        and (nvl(start_date_active, sysdate) <= sysdate
        and nvl(end_date_active, sysdate + 1) > sysdate)
    order by 1;
