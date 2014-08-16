define ["text!./logic.json", "require", "react", "EventEmitter", "lodash"], (logic, require, React, EventEmitter, _) ->

    components = {}

    wrapComponentDidMount = (component, cb) ->
        if component.C then console.warn "######### componentDidMount probably already wrapped!"

        oldComponentDidMount = component.componentDidMount
        component.componentDidMount = ->
            cb.apply @, arguments
            oldComponentDidMount.apply @, arguments if oldComponentDidMount

    getCachedComponent = (componentName) ->
        component = require "./#{componentName}/component"
        components[componentName] = component unless components[componentName]
        component

    createReactComponents = ->

        allComponents = JSON.parse(logic).components
        for component in allComponents
            getCachedComponent component

        for name, component of components
            do (name) ->
                wrapComponentDidMount component, ->
                    @modify = (stateChunk) ->
                        newState = _.merge @state, stateChunk
                        @setState newState
                        newState

            component.component = component.C = React.createClass component

    initOutputHandler = (outputComponentName, cause, eventName) ->
        outputComponent = getCachedComponent outputComponentName
        outputHandlerName = outputComponent.output[cause]
        oldOutputHandler = outputComponent[outputHandlerName]

        do (oldOutputHandler, outputHandlerName, eventName) ->
            outputComponent[outputHandlerName] = ->
                payload = oldOutputHandler.apply @, arguments
                EventEmitter.emit eventName, payload

    initInputHandler = (inputComponentName, actionName, eventName) ->
        inputComponent = getCachedComponent inputComponentName

        wrapComponentDidMount inputComponent, ->
            EventEmitter.on eventName, (payload) =>
                inputComponent.input[actionName].call @, payload



    initComponents: (cb) ->
        components = {}
        rules = JSON.parse(logic).rules
        for rule in rules
            outputComponentName = rule.when.component
            inputComponentName = rule.then.component
            cause = rule.when.cause
            actionName = rule.then.action
            eventName = "#{outputComponentName} - #{cause}"

            initOutputHandler outputComponentName, cause, eventName
            initInputHandler inputComponentName, actionName, eventName

        createReactComponents()
        cb()



