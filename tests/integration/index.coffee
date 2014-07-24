fs = require "fs"
_ = require "lodash"


files = _.filter fs.readdirSync(__dirname), (file) -> file isnt "index.coffee"

for file in files
	path = "#{__dirname}/#{file}"
	if fs.statSync(path).isFile()
		require path