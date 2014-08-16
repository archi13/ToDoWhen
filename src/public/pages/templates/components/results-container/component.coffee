define ["lodash"
        "react"
        "test-components/footer-info/component"
        "test-components/result-item/component"
        "test-components/clear-button/component",
        "test-components/data"],
    (_, React, FooterInfo, ResultItem, ClearButton, data) ->
        input:
            "Set search string in title": (payload) ->
                @modify searchString: payload.searchString
            "Filter data": (payload) ->
                str = payload.searchString.trim()
                if str
                    elements = _.filter data, (el) -> _.contains el.title.toLowerCase(), str.toLowerCase()
                    @modify {elements}
                else
                    @modify elements: data
                @countChanged()
        output:
            "Number of search results has changed": "countChanged"

        countChanged: -> count: this.state.elements.length

        getInitialState: ->
            searchString: ""
            elements: data
        render: ->
            search = `<p>You have searched for "{this.state.searchString}"</p>`
            noSearch = `<p>No search yet. All items displayed</p>`

            elements = []
            noElements = `<span>No elements found</span>`
            for element in this.state.elements
                elements.push `<ResultItem.C value={element} />`

            `(
                <div className="resultscontainer">
                    <div className="resultsheader">
                        {this.state.searchString ? search : noSearch}
                        <ClearButton.C />
                    </div>
                    <div className="result-list">
                        {elements.length ? <ul>{elements}</ul> :  noElements}
                    </div>
                    <div className="resultsfooter">
                        <FooterInfo.C />
                    </div>
                </div>
            )`
