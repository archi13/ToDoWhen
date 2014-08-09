`/** @jsx React.DOM */`

define ["react"
        "test-components/search/component"
        "test-components/result-details/component"
        "test-components/results-container/component" ],
    (React, Search, ResultDetails, ResultsContainer) ->
        React.createClass 
            render: ->
                `(
                    <div className="app">
                        <h3>Application container</h3>
                        <Search.component />
                        <ResultDetails />
                        <ResultsContainer />
                    </div>
                )`