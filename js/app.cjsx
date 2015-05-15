React  = require 'react'
Router = require 'react-router'

DefaultRoute      = Router.DefaultRoute
Link              = Router.Link
Route             = Router.Route
RouteHandler      = Router.RouteHandler
RouteHandlerMixin = Router.RouteHandlerMixin

console.log Router

MyRouterHandler = React.createClass
  mixins: [RouteHandlerMixin]
  shouldComponentUpdate:-> @props.isFlip
  render:->
    console.log(@createChildRouteHandler, RouteHandler)
    @createChildRouteHandler()

React.initializeTouchEvents(true);

App = React.createClass
  render:->
    <div>
      <header>
        <ul>
          <li><Link to="app">home</Link></li>
          <li><Link to="inbox">Inbox</Link></li>
          <li><Link to="calendar">Calendar</Link></li>
        </ul>
      </header>

      <RouteHandler isFlip={this.isFlip} />
      {# <RouteHandler isFlip={!this.isFlip} />}

    </div>

Inbox = React.createClass
  render: ()-> <div>Inbox</div>

Calendar = React.createClass
  render: ()-> <div>Calendar</div>

routes = (
  <Route name="app" path="/mojs.github.io/" handler={App}>
    <Route name="inbox" handler={Inbox}/>
    <Route name="calendar" handler={Calendar}/>
    <DefaultRoute handler={Inbox}/>
  </Route>
)

Router.run routes, Router.HistoryLocation, (Handler)->
  React.render(<Handler/>, document.body)

