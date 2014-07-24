app = require '../../index'
request = require 'supertest'

request(app)
	.get '/simple-get'
	.query 'result=done'
	.expect 'done'
	.end (err, res) ->
		if err
			console.log 'ERROR	simple get	- GET /simple-get'
		else
			console.log 'OK		simple get	- GET /simple-get'

request(app)
	.post '/simple-post'
	.send 'result=done'
	.expect "done"
	.end (err, res) ->
		if err
			console.log 'ERROR		simple post	- POST /simple-post'
		else
			console.log 'OK		simple post	- POST /simple-post'

request(app)
	.get '/tests/prefix-get'
	.query 'result=done'
	.expect 'done'
	.end (err, res) ->
		if err
			console.log 'ERROR	prefix get	- GET /tests/prefix-get'
		else
			console.log 'OK		prefix get	- GET /tests/prefix-get'

request(app)
	.post '/tests/prefix-post'
	.send 'result=done'
	.expect 'done'
	.end (err, res) ->
		if err
			console.log 'ERROR		prefix post	- POST /tests/prefix-post'
		else
			console.log 'OK		prefix post	- POST /tests/prefix-post'

request(app)
	.get '/middleware'
	.expect 'done'
	.end (err, res) ->
		if err
			console.log 'ERROR		middleware	- GET /middleware'
		else
			console.log 'OK		middleware	- GET /middleware'