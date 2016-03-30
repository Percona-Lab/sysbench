
pathtest = string.match(test, "(.*/)") or ""

dofile(pathtest .. "common.lua")

function event(thread_id)
    local mongo = require('mongo')

    local db = assert(mongo.Connection.New())

    assert(db:connect('localhost'))
    assert(db:insert('test.values',"{_id: 1}"))
    print(db:count('test.values'))
end