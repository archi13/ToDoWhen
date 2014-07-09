p = require "path"

global.config = 
  dev:
    port: 3000
  root: process.cwd()
  appPath: p.join process.cwd(), "src/app.coffee"

  