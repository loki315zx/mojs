React  = require 'react'
Router = require 'react-router'
Link              = Router.Link
RouteHandler      = Router.RouteHandler

Header = require './partials/header'

App = React.createClass
  render:->
    <div>
      <Header />
      <RouteHandler />
    </div>

module.exports = App