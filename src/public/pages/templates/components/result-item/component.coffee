define ["react"], (React) ->
    output:
        "Element was clicked": "clicked"
    clicked: -> element: this.props.value
    render: ->
        `(
            <li ref="el" onClick={this.clicked}>{this.props.value.title}</li>
        )`
