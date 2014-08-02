`/** @jsx React.DOM */`

define ["react", "test-components/search/component"], (React, Search) ->
    React.createClass 
        render: ->
            `(
                <div className="app">
                    <h3>Application container</h3>
                    <Search />
                </div>
            )`