

app = require "./src/app"
global.config = require "./src/config"

app.then ->
	console.log '#################### start catched ###########################'