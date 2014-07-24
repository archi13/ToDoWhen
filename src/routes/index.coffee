fs = require "fs"
npmPath = require "path"
_ = require "lodash"

module.exports = 
	load: (app) ->
		files = _.filter fs.readdirSync(__dirname), (file) -> file isnt "index.coffee"

		for file in files
			path = "#{__dirname}/#{file}"
			if fs.statSync(path).isDirectory()
				load path, app
			else
				require(path)(app)

	init: (app, routes, options = {}) ->
		options = _.defaults options, prefix: ""
		for route, methods of routes
			for method, handlers of methods
				if not _.isArray handlers then handlers = [handlers]
				if not _.contains ["get", "post", "put", "delete"], method then continue

				if options.middlewares
					if _.isArray options.middlewares
						handlers = options.middlewares.concat handlers
					else
						handlers.unshift options.middlewares

				fullUrl = npmPath.join "/", options.prefix, route
				handlers.unshift fullUrl
				app[method].apply app, handlers  