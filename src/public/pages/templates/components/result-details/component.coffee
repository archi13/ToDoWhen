`/** @jsx React.DOM */`

define ["react"
        "test-components/title/component"
        "test-components/description/component",
        "test-components/delete/component"],
    (React, Title, Description, Delete) ->
        React.createClass
            render: ->
                `(
                    <div className="red-border">
                        <h4>result details</h4>
                        <Title />
                        <Description />
                        <Delete />
                    </div>
                )`
