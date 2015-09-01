[![Gem Version](https://badge.fury.io/rb/picture_zoomer.svg)](http://badge.fury.io/rb/picture_zoomer)

[Here's a demo](https://cdn.rawgit.com/bluerail/picture_zoomer/master/demo.html)

Simple "zooming lightbox" that doesn't suck.

This is a fairly simple piece of JS code, but also something I've re-written a
number of times over the last few years. So here's the "canonical version".

Usage
=====
Include the [JavaScript code](https://github.com/bluerail/picture_zoomer/tree/master/lib/assets/javascripts). For Ruby on Rails, you can use the gem (see below).

All you need to do after that is tell it which images to zoom:

    $('img').picture_zoomer()

The larger version is loaded either from the `data-large` or `src` attribute:

    <img src="smaller_version.jpg" data-large="larger-version.jpg">
    <img src="large_version.jpg" style="width: 100px">

or if you also want your image to do something without JS:

    <a href="larger-version.jpg">
      <img src="smaller_version.jpg" data-large="larger-version.jpg">
    </a>

There's one (optional) argument: the animation speed. The default is 400ms.

    // Very fast!
    $('img').picture_zoomer(100)

    // Just show a large version (don't animate)
    $('img').picture_zoomer(0)

That's all there's to it :-)

Ruby on Rails installation
--------------------------
This is packaged as a Ruby gem ready to use in a Rails app.

Add to your `Gemfile`

    gem 'picture_zoomer'

Add to your `application.js`:

    // =require picture_zoomer
