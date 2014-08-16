define ["react"
        "test-components/search/component"
        "test-components/result-details/component"
        "test-components/results-container/component" ],
    (React, Search, ResultDetails, ResultsContainer) ->
        
        render: ->
            `(
                <div className="app">
                    <h3>Application container</h3>
                    <Search.C />
                    <ResultDetails.C />
                    <ResultsContainer.C />
                </div>
            )`