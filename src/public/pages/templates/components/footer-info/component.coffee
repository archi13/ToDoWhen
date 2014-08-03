`/** @jsx React.DOM */`

define ["react", "EventEmitter"], (React, EventEmitter) ->
    React.createClass
        getInitialState: ->
            {}
        render: ->
            `(
                <div className="">
                    footer info: {this.state.searchString}
                </div>
            )`
        componentDidMount: ->
            EventEmitter.on "SEARCH_CHANGE", (payload) =>
                @setState {searchString: payload.searchString}
