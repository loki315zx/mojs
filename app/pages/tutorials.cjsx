React  = require 'react'
Router = require 'react-router'
{ Route, RouteHandler, Link } = Router
Sidebar = require '../partials/tutorials-sidebar'

require '../css/pages/tutorials-page'
Tutorials = React.createClass render: ()->
  <div className="page tutorials-page">
    <div className="tutorials-page__sidebar"> <Sidebar />      </div>
    <div className="tutorials-page__content"> <RouteHandler /> </div>
  </div>

module.exports = Tutorials