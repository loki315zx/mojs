React  = require 'react'
Router = require 'react-router'
DefaultRoute      = Router.DefaultRoute
Route             = Router.Route
React.initializeTouchEvents(true)

App       = require './app'
Main      = require './pages/main'
Tutorials = require './pages/tutorials'

routes = (
  <Route name="app" path="/mojs/" handler={App}>
    <Route name="main"      handler={Main}/>
    <Route name="tutorials" handler={Tutorials}/>
    <DefaultRoute           handler={Main}/>
  </Route>
)

Router.run routes, Router.HistoryLocation, (Handler)->
  React.render(<Handler/>, document.body)

