`/** @jsx React.DOM */`

define ["react", "test-components/loader", "test-components/app/component"], (React, loader, App) ->
    loader.initComponents ->
        React.renderComponent `<App />`, document.getElementById "app"