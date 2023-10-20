--------------------------------------------------------
--  File created - Friday-October-20-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View XCUST_DEBT_PORT
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "APPS"."XCUST_DEBT_PORT" ("CODE", "DESCRIPTION") AS 
  SELECT FLEX_VALUE CODE, FLEX_VALUE || ' - ' || DESCRIPTION DESCRIPTION
      FROM FND_FLEX_VALUES_VL a
     WHERE     1 = 1
           AND EXISTS
                   (SELECT 1
                      FROM FND_FLEX_VALUE_SETS b
                     WHERE     a.FLEX_VALUE_SET_ID = b.FLEX_VALUE_SET_ID
                           AND FLEX_VALUE_SET_NAME = 'BAM_KEY_COA_PORT');
