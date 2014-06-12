express = require "express"
Promise = require "bluebird"
routes = require "./routes"

p = Promise.pending()
app = express()
routes.load app

app.listen 3000, ->
	p.fulfill()

module.exports = p.promise

