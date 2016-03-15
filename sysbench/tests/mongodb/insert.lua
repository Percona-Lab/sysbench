-- Copyright (C) 2016 Percona
pathtest = string.match(test, "(.*/)") or ""

dofile(pathtest .. "common.lua")

function thread_init(thread_id)
         db_connect()
	 set_vars()
end

function event(thread_id)
   id_val = sb_rand(1, oltp_table_size+1)
   k_val = sb_rand(1, oltp_table_size+1)
   c_val = sb_rand_str([[
###########-###########-###########-###########-###########-###########-###########-###########-###########-###########]])
   pad_val = sb_rand_str([[
###########-###########-###########-###########-###########]])
   mongodb_insert("sbtest" .. sb_rand_uniform(1, oltp_tables_count), id_val, k_val, c_val, pad_val)
end
