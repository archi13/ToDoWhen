routes = require "./index"

templateRoutes = 
    "/templates/test1":
        "get": (req, res, next) ->
            res.render "templates/test1"

    "/templates/test2":
        "get": (req, res, next) ->
            res.render "templates/test2"
            
module.exports = (app) ->
    routes.init app, templateRoutes