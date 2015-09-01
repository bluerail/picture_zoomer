all:
	coffee -c lib/assets/javascripts/picture_zoomer.js.coffee
	mv -f lib/assets/javascripts/picture_zoomer.js.js lib/assets/javascripts/picture_zoomer.js
