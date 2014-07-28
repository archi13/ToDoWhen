request = require 'supertest'
app = require '../../src/app.coffee'


describe 'Router', ->

    it 'should give status 200 and right data on GET query ', (done) ->
        request app
            .get '/simple-get'
            .query 'result=done'
            .expect 200
            .expect 'done'
            .end done
    
    it 'should give status 200 and right data on POST query', (done) ->
        request app
            .post '/simple-post'
            .send 'result=done'
            .expect 200
            .expect 'done'
            .end done
    
    it 'should give status 200 and right data on GET query to URL with prefix', (done) ->
        request app
            .get '/tests/prefix-get'
            .query 'result=done'
            .expect 200
            .expect 'done'
            .end done
    
    it 'should give status 200 and right data on POST query to URL with prefix', (done) ->
        request app
            .post '/tests/prefix-post'
            .send 'result=done'
            .expect 200
            .expect 'done'
            .end done
    
    it 'should give status 200 and right data on GET query to URL with middlewares', (done) ->
        request app
            .get '/middleware'
            .expect 200
            .expect 'done'
            .end done


