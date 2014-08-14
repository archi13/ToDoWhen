`/** @jsx React.DOM */`

define ["react"
        "test-components/footer-info/component"
        "test-components/result-item/component"
        "test-components/clear-button/component"],
    (React, FooterInfo, ResultItem, ClearButton) ->
        React.createClass
            render: ->
                `(
                    <div className="resultscontainer">
                        <div className="resultsheader"
                            <p>You have searched for: ...</p>
                            <ClearButton.C />
                        </div>
                        <div className="resultsfooter">
                            <FooterInfo.C />
                            <ClearButton.C />
                        </div>
                    </div>
                )`
