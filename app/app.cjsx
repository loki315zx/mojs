React  = require 'react'
Router = require 'react-router'
Link         = Router.Link
RouteHandler = Router.RouteHandler

require './css/main.styl'

Header = require './partials/header'

App = React.createClass
  render:->
    <div>
      <Header />
      <RouteHandler />
    </div>

module.exports = App