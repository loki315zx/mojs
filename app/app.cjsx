React  = require 'react'
Router = require 'react-router'
{ Route, RouteHandler, Link } = Router
Header          = require './partials/header'
TransitionGroup = require('react/lib/ReactTransitionGroup')

require './css/main.styl'

App = React.createClass
  contextTypes: router: React.PropTypes.func
  willEnter:->
    console.log aurguments
  render:->
    name = @context.router.getCurrentPath()
    <div>
      <TransitionGroup transitionName="example" transitionAppear="true">
        <Header />
        <RouteHandler  key={name} componentWillEnter=@willEnter componentDidEnter=@willEnter />
      </TransitionGroup>
    </div>

module.exports = App