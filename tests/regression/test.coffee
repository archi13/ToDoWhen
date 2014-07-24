casper.test.begin "bla test", (test) ->

    casper.start "http://localhost:3000", ->

        test.assertExists ".bla", "bla should exist"

    casper.run ->
        test.done() 