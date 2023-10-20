CREATE OR REPLACE FORCE VIEW APPS.XCUST_DEBT_TYPE_DTL_V
(DEBT_TYPE, DEBT_TYPE_DTL_ID, CREATED_BY, CREATED_DATE, UPDATE_BY, 
 UPDATE_DATE, TRAN_TYPE_ID, TRAN_TYPE_NAME, TRAN_TYPE_CODE, ACCOUNT_SEQ, 
 ACC_TYPE, CCID, CONCATENATED_SEGMENTS, BANK_ACCOUNT_FLAG, SHORT_LONG_FLAG, 
 DESCRIPTION)
BEQUEATH DEFINER
AS 
select xdtd.debt_type,
        xdtd.debt_type_dtl_id,
        xdtd.created_by,
        xdtd.created_date,
        xdtd.update_by,
        xdtd.update_date,
        xdtd.tran_type_id,
        xdtt.name as tran_type_name,
        xdtt.code as tran_type_code,
        xdtd.account_seq,
        case 
            when xdtd.ccid_dr is null then
                'CREDIT'
            when xdtd.ccid_cr is null then
                'DEBIT'
            else
                null
        end as acc_type,
        case 
            when xdtd.ccid_dr is null then
                ccid_cr
            when xdtd.ccid_cr is null then
                ccid_dr
            else
                -1
        end as ccid,
        gcck.concatenated_segments,
        xdtd.bank_account_flag,
        xdtd.short_long_flag,
        xdtd.description
    from xcust_debt_type_dtl xdtd,
        xcust_debt_tran_type_v xdtt,
        gl_code_combinations_kfv gcck
where 0 = 0 
    and xdtd.tran_type_id = xdtt.id(+)
    and case 
            when xdtd.ccid_dr is null then
                ccid_cr
            when xdtd.ccid_cr is null then
                ccid_dr
            else
                -1
        end = gcck.code_combination_id(+)
order by debt_type,
    debt_type_dtl_id,
    tran_type_id;
