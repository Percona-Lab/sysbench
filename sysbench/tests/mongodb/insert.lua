-- Copyright (C) 2016 Percona
pathtest = string.match(test, "(.*/)") or ""

dofile(pathtest .. "common.lua")

function thread_init(thread_id)
         db_connect()
	 set_vars()
end

function event(thread_id)

   for i=1, sb_rand(2, oltp_inserts) do
	local c_val = sb_rand_str([[
     ###########-###########-###########-###########-###########-###########-###########-###########-###########-###########]])
	local pad_val = sb_rand_str([[
     ###########-###########-###########-###########-###########]])
       mongodb_oltp_insert("sbtest" .. sb_rand(1, oltp_tables_count+1), sb_rand(1, oltp_table_size), sb_rand(1, oltp_table_size), c_val, pad_val)
   end
 
end
