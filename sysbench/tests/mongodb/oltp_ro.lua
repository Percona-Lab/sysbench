-- Copyright (C) 2016 Percona
pathtest = string.match(test, "(.*/)") or ""

dofile(pathtest .. "common.lua")

function thread_init(thread_id)
         db_connect()
	 set_vars()
end

function event(thread_id)
   for i=1, oltp_point_selects do
      mongodb_point_select("sbtest" .. sb_rand(1,oltp_tables_count+1),sb_rand(1,oltp_table_size))
   end
   
   for i=1, oltp_simple_ranges do
      range_start = sb_rand(1, oltp_table_size)
      range_end = range_start + oltp_range_size 
      mongodb_simple_range("sbtest" .. sb_rand(1,oltp_tables_count+1), sb_rand(1,oltp_tables_count+1), range_start, range_end)
   end

   for i=1, oltp_sum_ranges do
      range_start = sb_rand(1, oltp_table_size)
      range_end = range_start + oltp_range_size 
      mongodb_sum_range("sbtest" .. sb_rand(1,oltp_tables_count+1), sb_rand(1,oltp_tables_count+1), range_start, range_end)
   end

   for i=1, oltp_order_ranges do
      range_start = sb_rand(1, oltp_table_size)
      range_end = range_start + oltp_range_size 
      mongodb_order_range("sbtest" .. sb_rand(1,oltp_tables_count+1), sb_rand(1,oltp_tables_count+1), range_start, range_end)
   end
 
   for i=1, oltp_distinct_ranges do
      range_start = sb_rand(1, oltp_table_size)
      range_end = range_start + oltp_range_size 
      mongodb_distinct_range("sbtest" .. sb_rand(1,oltp_tables_count+1), sb_rand(1,oltp_tables_count+1), range_start, range_end)
   end
   
end
