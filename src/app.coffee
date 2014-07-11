express = require "express"
Promise = require "bluebird"
routes = require "./routes"
path = require "path"

p = Promise.pending()
app = express()
routes.load app

app.set "views", path.join(__dirname, "src/public/views")
app.set "view engine", "jade"
app.use express.static path.join process.cwd(), "build"

app.listen global.config.dev.port, ->
  p.fulfill()
  console.log "#################### app is started at #{global.config.dev.port} ###########################"

app.promise = p.promise

module.exports = app

