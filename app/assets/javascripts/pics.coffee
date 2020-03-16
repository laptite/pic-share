$ ->
  $('#pics').masonry
    itemSelector: '.box'
    columnWidth: 200
    isAnimated: !Modernizr.csstransitions
    isFitWidth: true
  return
