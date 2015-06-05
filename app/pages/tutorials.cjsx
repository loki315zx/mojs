React  = require 'react'
Router = require 'react-router'
{ Route, RouteHandler, Link } = Router
Sidebar         = require '../partials/tutorials-sidebar'
TransitionGroup = require '../partials/transition-group'
require '../css/pages/tutorials-page'
Sticky          = require '../vendor/react-sticky'
# Sticky          = require 'react-sticky'
Tappable        = require 'react-tappable'
mojs            = require 'mo-js'

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

    node = @getDOMNode().querySelector '#js-expand-btn'
    @burst = new mojs.Burst
      parent:     node
      x: '15%',   y: '50%'
      radius:     30: 70
      degree:     160
      angle:      10
      delay:      2000
      count:      4
      fill:       'white'
      duration:   400
      childOptions: radius: 4:0

  render: ()->
    sidebarClass = if @state.isSidebarOpen then 'is-sidebar-open' else ''
    name = @context.router.getCurrentPath()
    <div className="page tutorials-page #{sidebarClass}">
      <Sticky className="tutorials-page__sticky-sidebar">
        <div className="tutorials-page__sidebar">
          <Tappable className="tutorials-page__expand-btn" id="js-expand-btn" onTap=@_toggleSidebar >
            <svg  width="20px" height="40px" viewBox="0 0 20 40" className="tutorials-page__expand-btn-svg"
                  className="tutorials-page__svg-arrow"
                  dangerouslySetInnerHTML={{__html: '<path d="M7,14 L13,20 L7,26" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-miterlimit="200" stroke-linejoin="round" fill="none"></path>'}}>
            </svg>
          </Tappable>
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
