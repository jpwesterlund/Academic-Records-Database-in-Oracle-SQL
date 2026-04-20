-- Academic Records Database in Oracle SQL
-- admin/describe_table.sql
-- Recreates Oracle DESCRIBE-style output using data dictionary views,
-- including column-level comments when available
--
-- Inputs:
--   &owner      - Schema owner (case-insensitive)
--   &table_name - Table name (case-insensitive)
--
-- Output:
--   Name | Null? | Type | Comments
--
-- Usage:
--   Run in Oracle SQL*Plus or Oracle Live SQL:
--   @admin/describe_table.sql
--   Enter owner and table name when prompted
--
-- Notes:
--   - Read-only script with no side effects
--   - Works for tables accessible to the current user

select c.column_name as "Name",
       case
          when c.nullable = 'N' then
             'NOT NULL'
          else
             ''
       end as "Null?",
       c.data_type
       ||
       case
             when c.data_type in ( 'CHAR',
                                   'VARCHAR2',
                                   'NCHAR',
                                   'NVARCHAR2' ) then
                '('
                || c.data_length
                || ')'
             when c.data_type = 'NUMBER'
                and c.data_precision is not null then
                '('
                || c.data_precision
                ||
                case
                   when c.data_scale is not null then
                         ',' || c.data_scale
                   else
                      ''
                end
                || ')'
             else
                ''
       end
       as "Type",
       com.comments as "Comments"
  from all_tab_columns c
  left join all_col_comments com
on c.owner = com.owner
   and c.table_name = com.table_name
   and c.column_name = com.column_name
 where c.owner = upper('&owner')
   and c.table_name = upper('&table_name')
 order by c.column_id;