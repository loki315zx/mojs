React  = require 'react'
Router = require 'react-router'
{ Route, RouteHandler, Link } = Router
Header          = require './partials/header'
TransitionGroup = require('react/lib/ReactCssTransitionGroup')
VTransitionGroup = require('./partials/velocity-transition-group')

require './css/main.styl'

App = React.createClass
  contextTypes: router: React.PropTypes.func
  willTransit:->
    console.log 'a'
  render:->
    name = @context.router.getCurrentPath()
    <div>
      <Header />
      <VTransitionGroup  transitionName="slideover-forward">
        <RouteHandler  key={name} />
      </VTransitionGroup>
    </div>

# <TransitionGroup transitionName="example">
#   <RouteHandler  key={name} />        
# </TransitionGroup>

module.exports = App