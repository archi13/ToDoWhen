`/** @jsx React.DOM */`

define ["react", "EventEmitter"], (React, EventEmitter) ->
    React.createClass
        getInitialState: -> 
            searchString: ""
        change: ->
            str = @refs.search.getDOMNode().value
            @setState searchString: str
            EventEmitter.emit "SEARCH_CHANGED", searchString: str
        
        render: ->
            `(
                <div>
                    <input ref="search" placeholder="Search something" value={this.state.searchString} onChange={this.change} />
                </div>
            )` 