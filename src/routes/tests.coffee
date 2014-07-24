routes = require "./index"

testsRoutes = 

    "simple-get":
        "get": (req, res, next) ->
            res.end req.query.result
            
    "simple-post":
        "post": (req, res, next) ->
            res.end req.body.result

    "middleware":
        "get": [
            (req, res, next) ->
                if (res.locals.test == 1)
                    res.locals.test = 2
                next()
            (req, res, next) ->
                if (res.locals.test == 2)
                    res.locals.test = 3
                next()
            (req, res, next) ->
                if (res.locals.test == 3)
                    res.end 'done'
        ]

module.exports = (app) ->
    routes.init app, testsRoutes, middlewares: (req, res, next) ->
        res.locals.test = 1
        next()