app = require "./src/app"
path = require "path"

global.config = require "./src/config"

app.promise.then ->
	console.log '#################### start catched ###########################'