const { environment } = require('@rails/webpacker')
const customConfig = require('./custom')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Masonry: 'masonry-layout'
  })
)
environment.config.merge(customConfig)

module.exports = environment