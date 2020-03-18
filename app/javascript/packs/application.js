require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

const $ = require('jquery');
const Masonry = require('masonry-layout');
const Modernizr = require('modernizr');

window.onload = function(){
	const pics = document.querySelector('#pics');
	const msnry = new Masonry( pics, {
	  itemSelector: '.box',
	  columnWidth: 200,
	  isFitWidth: true,
	  isAnimated: !Modernizr.csstransitions
	});
}