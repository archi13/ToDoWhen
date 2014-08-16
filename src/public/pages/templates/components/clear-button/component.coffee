define ["react", "EventEmitter"], (React, EventEmitter) ->
    
    output:
        "Clear button pressed": "change"
    
    change: ->


    render: ->
        `(
            <div className="clearbutton" onClick={this.change}>
                clear
            </div>
        )`
