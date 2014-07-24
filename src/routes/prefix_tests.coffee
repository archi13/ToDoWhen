routes = require "./index"

prefixTestsRoutes =

    "prefix-get":
        "get": (req, res, next) ->
            res.end req.query.result

    "prefix-post":
        "post": (req, res, next) ->
            res.end req.body.result

module.exports = (app) ->
    routes.init app, prefixTestsRoutes, {prefix: "tests"}