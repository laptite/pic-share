require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

const $ = require('jquery');
const Masonry = require('masonry-layout');
const Modernizr = require('modernizr');
const pics = document.getElementById('#pics');

window.onload = function(){

	if(typeof(pics) != 'undefined' && pics != null) {
		const msnry = new Masonry( pics, {
		  itemSelector: '.box',
		  columnWidth: 200,
		  isFitWidth: true,
		  isAnimated: !Modernizr.csstransitions
		});
  }
}