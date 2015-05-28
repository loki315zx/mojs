React  = require 'react'
Router = require 'react-router'
{ Route, RouteHandler, Link } = Router
Sidebar         = require '../partials/tutorials-sidebar'
TransitionGroup = require '../partials/transition-group'
require '../css/pages/tutorials-page'

module.exports = React.createClass
  contextTypes: router: React.PropTypes.func
  render: ()->
    name = @context.router.getCurrentPath()
    <div className="page tutorials-page">
      <div className="tutorials-page__sidebar"> <Sidebar />      </div>
      <div className="tutorials-page__content">
        <TransitionGroup>
          <RouteHandler  key={name} />
        </TransitionGroup>
      </div>
    </div>
