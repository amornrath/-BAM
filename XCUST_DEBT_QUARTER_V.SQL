CREATE OR REPLACE FORCE VIEW APPS.XCUST_DEBT_QUARTER_V
(ID, CODE, NAME)
BEQUEATH DEFINER
AS 
select to_number(l.lookup_code) as SEQ, 
            l.meaning QUARTER_NAME,
            l.description 
    from fnd_lookup_values_vl l
    where l.lookup_type = 'XCUST_DEBT_QUARTER'
        and l.enabled_flag = 'Y'
        and (nvl(start_date_active, sysdate) <= sysdate
        and nvl(end_date_active, sysdate + 1) > sysdate)
    order by 1;
