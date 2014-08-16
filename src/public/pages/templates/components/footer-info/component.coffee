define ["react", "test-components/clear-button/component"], (React, ClearButton) ->

    input:
        "Change number of results in footer": (payload) ->
            @modify count: payload.count
        "Change search string in footer": (payload) ->
            @modify searchString: payload.searchString

    getInitialState: ->
        count: 0
        searchString: ""

    render: ->
        info = `<span>{this.state.count} results for "{this.state.searchString}"</span>`
        noSearch = `<span>No search yet</span>`
        `(
            <div className="">
                {this.state.searchString.length ? info : noSearch}
                <ClearButton.C />
            </div>
        )`