React  = require 'react'
Router = require 'react-router'
{ Route, RouteHandler, Link } = Router
UniteLink = require './unite-link'

require '../css/partials/tutorials-sidebar'
module.exports = React.createClass render: ()->
  <div className="tutorials-sidebar">
    <div className="tutorials-sidebar__section">
      <div className="tutorials-sidebar__header"> Basics </div>
      <UniteLink link="getting-started" className="tutorials-sideba__link"> Getting Started </UniteLink>
    </div>
  </div>
