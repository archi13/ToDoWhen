`/** @jsx React.DOM */`

define ["react", "test-components/clear-button/component"], (React, ClearButton) ->

    input:
        "Change number of results in footer": (payload) ->
            state = @modify count: payload.count
        "Change search string in footer": (payload) ->
            state = @modify searchString: payload.searchString

    getInitialState: ->
        count: 0
        searchString: ""

    render: ->
        info = `<span>{this.state.count} results for {this.state.searchString}</span>`
        `(
            <div className="">
                {this.state.searchString.length ? info : ''}
                <ClearButton />
            </div>
        )`