React  = require 'react'
Router = require 'react-router'
{ Route, RouteHandler, Link } = Router
Sidebar         = require '../partials/tutorials-sidebar'
TransitionGroup = require '../partials/transition-group'
require '../css/pages/tutorials-page'
Sticky          = require 'react-sticky'
Tappable        = require 'react-tappable'

# transition = null
module.exports = React.createClass
  contextTypes: router: React.PropTypes.func
  getInitialState:-> {isSidebarOpen: false}
  _toggleSidebar:-> @setState isSidebarOpen: !@state.isSidebarOpen

  componentDidMount:->
    if @context.router.getCurrentPath() is '/tutorials'
      setTimeout =>
        @context.router.transitionTo('/tutorials/getting-started')
      , 150
  render: ()->
    sidebarClass = if @state.isSidebarOpen then 'is-sidebar-open' else ''
    name = @context.router.getCurrentPath()
    <div className="page tutorials-page #{sidebarClass}">
      <Sticky className="tutorials-page__sticky-sidebar">
        <div className="tutorials-page__sidebar">
          <Tappable className="tutorials-page__expand-btn" onTap=@_toggleSidebar></Tappable>
          <div className="tutorials-page__sidebar-scroll">
            <Sidebar />
          </div>
        </div>
      </Sticky>
      <div className="tutorials-page__content">
        <TransitionGroup isFade={true}>
          <RouteHandler  key={name} />
        </TransitionGroup>
      </div>
    </div>
