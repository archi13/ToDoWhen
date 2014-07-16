routes = require "./index"

templateRoutes = 
    "home":
        "get": (req, res, next) ->
            res.render "templates/home"
    "test1":
        "get": (req, res, next) ->
            res.render "templates/test1"

        "post": (req, res, next) ->
            console.log '#################### req.body is', req.body
            res.end "post handled!"

    "test2":
        "get": (req, res, next) ->
            res.render "templates/test2"

module.exports = (app) ->
    routes.init app, templateRoutes, prefix: "templates"