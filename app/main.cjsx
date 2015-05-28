React  = require 'react'
Router = require 'react-router'
DefaultRoute      = Router.DefaultRoute
Route             = Router.Route
React.initializeTouchEvents(true)

App       = require './app'
Main      = require './pages/main'
Tutorials = require './pages/tutorials'
GettingStarted = require './pages/tutorials/getting-started'
MotionPath     = require './pages/tutorials/motion-path'

routes = (
  <Route name="app" path="/" handler={App}>
    <Route name="main"      handler={Main}/>
    <Route name="tutorials" handler={Tutorials}>
      <Route name="getting-started" handler={GettingStarted} />
      <Route name="motion-path"     handler={MotionPath} />
    </Route>
    <DefaultRoute                   handler={Main}/>
  </Route>
)

# Router.run routes, Router.HistoryLocation, (Handler)->
Router.run routes, (Handler)->
  React.render(<Handler/>, document.getElementById('js-content'))

