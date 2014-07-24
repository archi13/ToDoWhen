express = require "express"
Promise = require "bluebird"
routes = require "./routes"
path = require "path"
bodyParser = require "body-parser"

p = Promise.pending()
app = express()

app.set "views", path.join(__dirname, "public/views")
app.set "view engine", "jade"
app.use express.static path.join process.cwd(), "build"
app.use bodyParser.urlencoded {extended: true}


routes.load app

app.listen global.config.dev.port, ->
    p.fulfill()
    console.log "#################### app is started at #{global.config.dev.port} ###########################"

app.promise = p.promise

module.exports = app