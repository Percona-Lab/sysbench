

function event(thread_id)
    local mongo = require('mongo')

    local db = mongo.Connection.New()
    db:connect('localhost')
    db:insert('test.values',"{a: 1}")
    db_count_write() 
    db:insert('test.values',"{a: 2}")
    db_count_write() 
    db:insert('test.values',"{a: 3}")
    db_count_write() 
    db_count_commit()
end
