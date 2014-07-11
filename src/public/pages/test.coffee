define ["jquery", "./anotherDependency"], ($) ->
    console.log "Test is loaded"
    if $
        console.log "Jquery is loaded as dependency"
    else
        console.log "Something is wrong..."