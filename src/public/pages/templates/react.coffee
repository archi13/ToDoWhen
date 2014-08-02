`/** @jsx React.DOM */`

define ["react", "test-components/app/component"], (React, App) ->
    React.renderComponent `<App />`, document.getElementById "app"