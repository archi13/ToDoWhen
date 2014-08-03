`/** @jsx React.DOM */`

define ["react", "EventEmitter"], (React, EventEmitter) ->
    React.createClass
        inputs:
            "Clears search string": ->
                @setState searchString: ""
        getInitialState: ->
            searchString: ""
        change: ->
            str = @refs.search.getDOMNode().value
            @setState searchString: str
            output "Search string changed", searchString: str
        render: ->
            `(
                <div>
                    <input ref="search" placeholder="Search something" value={this.state.searchString} onChange={this.change} />
                </div>
            )`
