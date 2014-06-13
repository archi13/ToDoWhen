express = require "express"
Promise = require "bluebird"
routes = require "./routes"
path = require "path"

p = Promise.pending()
app = express()
routes.load app

app.set "views", path.join(__dirname, "views")
app.set "view engine", "jade"

app.listen 3000, ->
	p.fulfill()

app.promise = p.promise

module.exports = app

