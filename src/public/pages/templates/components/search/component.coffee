define ["react", "EventEmitter"], (React, EventEmitter) ->
    input:
        "Clears search string": ->
            @setState searchString: ""
    output:
        "Search string changed": "change"
        "Number of results has changed": "changeNum"
    getInitialState: ->
        searchString: ""
    change: ->
        str = @refs.search.getDOMNode().value
        num = parseInt str.length / 4
        @changeNum num
        @modify searchString: str
    changeNum: (num) -> count: num
    render: ->
        `(
            <div className="searchfield">
                <h4>Search</h4>
                <input ref="search" placeholder="Search something" value={this.state.searchString} onChange={this.change} />
            </div>
        )`
