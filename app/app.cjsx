React  = require 'react'
Router = require 'react-router'
{ Route, RouteHandler, Link } = Router
Header           = require './partials/header'
TransitionGroup = require('./partials/transition-group')
require './css/main.styl'

App = React.createClass
  contextTypes: router: React.PropTypes.func
  render:->
    name = @context.router.getCurrentPath()
    <div>
      <Header />
      <TransitionGroup>
        <RouteHandler  key={name} />
      </TransitionGroup>
    </div>


module.exports = App