'use strict'

# Simple "zooming lightbox" that doesn't suck.
#
# Basic usage:
#   $('.body img').picture_zoomer()
#
#   // Faster animation
#   $('.body img').picture_zoomer(200)
#
#   // Don't animate
#   $('.body img').picture_zoomer(0)
#
# The url for the large version is either 'data-large', or the image src
jQuery.fn.picture_zoomer = (speed=400) ->
  $(this).on 'click', (e) ->
    e.preventDefault()
    if $(this).is('img')
      zoom $(this), speed
    else
      zoom $(this).find('img'), speed


get_scroll = -> document.documentElement.scrollTop or document.body.scrollTop

zoom = (img, speed) ->
  large = $(new Image())
  large.attr 'src', (img.attr('data-large') or img.attr('src'))
  offset = img.offset()

  large.on 'load', ->
    width = large.prop 'width'
    height = large.prop 'height'

    # Don't make it larger than the window
    w_width = $(window).width() - 25
    w_height = $(window).height() - 25
    if width > w_width
      height = height / (width / w_width)
      width = w_width
    if height > w_height
      width = width / (height / w_height)
      height = w_height

    large.css
      width: img.width()
      height: img.height()
      left: offset.left
      top: offset.top
      position: 'absolute'
      'box-shadow': '0 0 8px rgba(0, 0, 0, .3)'
      'z-index': 5000
    $(document.body).append large

    large.animate {
      width: width
      height: height
      left: ($(window).width() - width) / 2
      top: ($(window).height() + $('#menu').height() - height) / 2 + get_scroll()
    }, {
      duration: speed
    }

    # Close
    close = ->
      large.animate {
        width: img.width()
        height: img.height()
        left: offset.left
        top: offset.top
      }, {
        duration: speed
        complete: -> large.remove()
      }
    $(document.body).one 'click', close
    $(document).on 'keydown.photo_viewer', (e) ->
      return unless e.keyCode is 27 # Esc
      close()
      $(document).off 'keydown.photo_viewer'
