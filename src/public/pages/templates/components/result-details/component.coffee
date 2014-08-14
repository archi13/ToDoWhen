`/** @jsx React.DOM */`

define ["react"
        "test-components/title/component"
        "test-components/description/component",
        "test-components/delete/component"],
    (React, Title, Description, Delete) ->
        React.createClass
            render: ->
                `(
                    <div className="resultdetails">
                        <Title />
                        <Description />
                        <Delete />
                    </div>
                )`
