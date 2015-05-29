React  = require 'react'
Router = require 'react-router'
{ Route, RouteHandler, Link } = Router
Sidebar         = require '../partials/tutorials-sidebar'
TransitionGroup = require '../partials/transition-group'
require '../css/pages/tutorials-page'

# transition = null
module.exports = React.createClass
  contextTypes: router: React.PropTypes.func
  # statics:      willTransitionTo:(trans)-> transition = trans
  componentDidMount:->
    if @context.router.getCurrentPath() is '/tutorials'
      setTimeout =>
        @context.router.transitionTo('/tutorials/getting-started')
      , 250
  render: ()->
    name = @context.router.getCurrentPath()
    <div className="page tutorials-page">
      <div className="tutorials-page__sidebar"> <Sidebar /> </div>
      <div className="tutorials-page__content">
        <TransitionGroup>
          <RouteHandler  key={name} />
        </TransitionGroup>
      </div>
    </div>
