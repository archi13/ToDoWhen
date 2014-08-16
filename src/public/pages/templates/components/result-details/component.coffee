define ["react"
        "test-components/title/component"
        "test-components/description/component",
        "test-components/delete/component"],
    (React, Title, Description, Delete) ->
        render: ->
            `(
                <div className="resultdetails">
                    <Title.C />
                    <Description.C />
                    <Delete.C />
                </div>
            )`
