`/** @jsx React.DOM */`

define ["react", "EventEmitter"], (React, EventEmitter) ->
    React.createClass
        output:
            "Search string changed": "change"
        change: ->
            @modify searchString: ""
        render: ->
            `(
                <div className="clearbutton" onClick={this.change}>
                    clear
                </div>
            )`
