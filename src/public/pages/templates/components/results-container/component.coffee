`/** @jsx React.DOM */`

define ["react"
        "test-components/footer-info/component"
        "test-components/result-item/component"
        "test-components/clear-button/component"],
    (React, FooterInfo, ResultItem, ClearButton) ->
        React.createClass
            render: ->
                `(
                    <div className="green-border">
                        <h4>results container</h4>
                        <FooterInfo.C />
                        <ResultItem />
                        <ClearButton />
                    </div>
                )`
