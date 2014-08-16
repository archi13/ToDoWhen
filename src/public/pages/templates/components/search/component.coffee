define ["react", "EventEmitter"], (React, EventEmitter) ->
    input:
        "Clears search string": ->
            @changeStr ""
    output:
        "Search string changed": "changeStr"
        "Number of results has changed": "changeNum"
    getInitialState: ->
        searchString: ""
    change: ->
        str = @refs.search.getDOMNode().value
        num = parseInt str.length / 4
        @changeNum num
        @changeStr str
    changeStr: (str) -> @modify searchString: str
    changeNum: (num) -> count: num
    render: ->
        `(
            <div className="searchfield">
                <h4>Search</h4>
                <input ref="search" placeholder="Search something" value={this.state.searchString} onChange={this.change} />
            </div>
        )`
