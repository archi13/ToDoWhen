exec = require("child_process").exec
p = require "path"

testPath = p.join __dirname, "test.coffee"

exec "casperjs test #{testPath}", (err, stdout) ->
    if err then console.log "### Error:", err
    console.log stdout 