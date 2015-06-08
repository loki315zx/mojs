React  = require 'react'
Router = require 'react-router'
{ Route, RouteHandler, Link } = Router
Sidebar         = require '../partials/tutorials-sidebar'
TransitionGroup = require '../partials/transition-group'
require '../css/pages/tutorials-page'
Sticky          = require '../vendor/react-sticky'
Physics         = require('impulse')
# Sticky          = require 'react-sticky'
Tappable        = require 'react-tappable'
mojs            = require 'mo-js'

# transition = null
module.exports = React.createClass
  contextTypes: router: React.PropTypes.func
  getInitialState:->   { isSidebarOpen: false }
  _toggleSidebar:->    @setState isSidebarOpen: !@state.isSidebarOpen
  componentDidMount:-> @_redirect(); @_showBurst(); @_addImpulse()
  componentDidUpdate:->
    if @state.isSidebarOpen then @_showSidebar() else @_hideSidebar()

  _addImpulse:->
    node       = @getDOMNode()
    sidebarBtn = node.querySelector '#js-expand-btn'
    sidebar    = node.querySelector '#js-sidebar'
    this.sidebarWidth = sidebar.offsetWidth
    boundary = new Physics.Boundary
      left: -this.sidebarWidth, right: 0, top: 0, bottom: 0

    @impulseMenu = new Physics(sidebar)
      .style 'translateX', (x, y)-> return "#{x}px"
      .position(-this.sidebarWidth)

    drag = @impulseMenu.drag
      handle: sidebar, boundary: boundary, direction: 'horizontal'

    it = @
    drag.on 'end', ->
      return if !@moved()
      it.setState isSidebarOpen: !it.impulseMenu.direction('left')

  _showSidebar:-> @impulseMenu.spring(tension: 1000, damping: 100).to(0, 0).start()
  _hideSidebar:->
    @impulseMenu.spring(tension: 1000, damping: 100)
      .to(-this.sidebarWidth, 0).start()

  _showBurst:->
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

  _redirect:->
    if @context.router.getCurrentPath() is '/tutorials'
      setTimeout =>
        @context.router.transitionTo('/tutorials/getting-started')
      , 150

  render: ()->
    sidebarClass = if @state.isSidebarOpen then 'is-sidebar-open' else ''
    name = @context.router.getCurrentPath()
    <div className="page tutorials-page #{sidebarClass}">
      <Sticky className="tutorials-page__sticky-sidebar">
        <div className="tutorials-page__sidebar" id="js-sidebar">
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
