define ["jquery"], ($) ->
    $("*").on "selectstart", false

    $(".after-at").on "click", (ev) ->
        $block = $ ev.currentTarget
        $block.toggleClass "after-at_up"
        $block.toggleClass "after-at_down"
        $block.find(".after-at__item").toggleClass "after-at__item_active"

    $(".toggler").on "click", (ev) ->
        $el = $ ev.currentTarget
        $el.toggleClass "toggler_active"
