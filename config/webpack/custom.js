const path = require('path');

module.exports = {
  module: {

    rules: [
    { 
      test: /\.modernizrrc$/,
      loader: "modernizr-loader!json-loader"
    }
  ]
  },
  resolve: {
    alias: {
      $: 'jquery/src/jquery',
    	jQuery: 'jquery/src/jquery',
    	Masonry: 'masonry-layout',
    	modernizr$: path.resolve(__dirname, './.modernizrrc')
    }
  }
}
