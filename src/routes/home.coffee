routes = require "./index"

homeRoutes = 
	"/":
		"get": (req, res, next) ->
			res.end "home router"

		"post": (req, res, next) ->
			res.end "post on home"

	"test":
		"get": [(req, res, next) ->
			console.log '#################### first test handler ###########################'
			next()
		, (req, res, next) ->
			console.log '#################### second test handler ###########################'
			res.end "handled!"
		]



module.exports = (app) ->
	routes.init app, homeRoutes